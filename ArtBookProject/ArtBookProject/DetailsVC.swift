//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Fhewn on 24.10.2025.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtArtist: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = " "
    var chosenPaintingId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if chosenPainting != " " {
            
            saveButton.isHidden = true
            
            //Core Data
            
            
            
            let AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = AppDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "recid = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            do{
                let results = try context.fetch(fetchRequest)
                
                if results .count > 0 {
                    
                    for results in results as! [NSManagedObject] {
                        
                        if let name = results.value(forKey: "name") as? String {
                            
                            txtName.text = name
                        }
                        if let artist = results.value(forKey: "artist") as? String {
                            
                            txtArtist.text = artist
                        }
                        
                        if let year = results.value(forKey: "year") as? Int {
                            
                            txtYear.text = String(year)
                        }
                        
                        if let imageDate = results.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageDate)
                            imageView.image = image
                        }
                            
                        
                    }
                    
                }
            } catch {
                print("error")
            }
            
            
        } else {
            
            saveButton.isEnabled = false
            saveButton.isHidden = false
            txtName.text = " "
            txtArtist.text = " "
            txtYear.text = " "
            
        }

        
        //Recognizers
        
       let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info [.originalImage] as? UIImage
        saveButton.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        
        
        
        //Attributes
        
        newPainting.setValue(txtName.text!, forKey: "name")
        newPainting.setValue(txtArtist.text!, forKey: "artist")
        
        if let year = Int(txtYear.text!){
            
            newPainting.setValue(year, forKey: "year")
            
        }
        
        newPainting.setValue(UUID(), forKey: "recid")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("success")
        }catch
        {
            print("error")
        }
        NotificationCenter.default.post(name: NSNotification.Name("newDataSaved"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

