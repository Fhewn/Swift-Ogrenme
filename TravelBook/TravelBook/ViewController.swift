//
//  ViewController.swift
//  TravelBook
//
//  Created by Fhewn on 28.10.2025.
//

import UIKit
import MapKit
import CoreLocation
import CoreData
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var nameText: UITextField!
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedTitleID : UUID?
    
    var annotationTitle = ""
    var annotationSubTitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    
    @IBOutlet weak var commentText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
        if selectedTitle != ""{
            //Core Data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedTitleID!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let title =  result.value(forKey: "title") as? String {
                            annotationTitle = title
                            if let subtitle = result.value(forKey: "subtitle") as? String{
                                annotationSubTitle = subtitle
                                if let latitude = result.value(forKey: "latitude") as? Double{
                                    annotationLatitude = latitude
                                }
                                if let longitude = result.value(forKey: "longitude") as? Double{
                                    annotationLongitude = longitude
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.title = annotationTitle
                                    annotation.subtitle = annotationSubTitle
                                    let cordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                    annotation.coordinate = cordinate
                                    
                                    mapView.addAnnotation(annotation)
                                    nameText.text = annotationTitle
                                    commentText.text = annotationSubTitle
                                    
                                    locationManager.stopUpdatingLocation()
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let region = MKCoordinateRegion(center: cordinate, span: span)
                                    mapView.setRegion(region, animated: true)
                                }
                            }
                        }
                    }
                }
            }catch{
                print("error")
            }
        
            
            
        }else{
            //Add New Data
        }
        
    }
    
    
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer){
        
        
        if gestureRecognizer.state == .began {
            
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            let annotion = MKPointAnnotation()
            annotion.coordinate = touchedCoordinates
            annotion.title = nameText.text
            annotion.subtitle = commentText.text
            self.mapView.addAnnotation(annotion)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedTitle == ""{
            
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.latitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }else {
            //
    }
    }

    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseIdentifier = "pinid"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKPinAnnotationView
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pinView?.canShowCallout = true
            pinView?.tintColor = UIColor.red
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedTitle != ""{
            let reuestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            classForCoder().reverseGeocodeLocation(reuestLocation){(placemarks,error)in
                
            if let placeMark = placemarks{
                if placeMark.count > 0{
                    let newPlaceMark = MKPlacemark(placemark: placeMark[0])
                    let item = MKMapItem(placemark: newPlaceMark)
                    item.name = self.selectedTitle
                    let lounchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsMode] = [MKLaunchOptionsDirectionsModeKey: .driving]
                    MKMapItem.openMaps(with: [item], launchOptions: lounchOptions)
                
                    
                }
                    
                }
            }
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "laitude")
        newPlace.setValue(chosenLongitude, forKey: "longtude")
        newPlace.setValue(UUID(), forKey: "id")
        
        
        do{
            try context.save()
            print("Success")
        } catch
        {
            print("error")
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlaceSaved"), object: nil)
        navigationController?.popViewController(animated: true)
        
        
    }
}
