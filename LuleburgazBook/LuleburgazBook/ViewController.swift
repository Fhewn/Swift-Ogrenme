//
//  ViewController.swift
//  LuleburgazBook
//
//  Created by Fhewn on 21.10.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = " "
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Lüleburgaz Giriş")
        landmarkNames.append("Lüleburgaz Belediye")
        landmarkNames.append("Lüleburgaz İstasyon")
        landmarkNames.append("Lüleburgaz Sokulu Cami")
        landmarkNames.append("Lüleburgaz Taş Köprü")
        
        
        landmarkImages.append(UIImage(named: "luleburgazgiris.jpeg")!)
        landmarkImages.append(UIImage(named: "luleburgazBelediye.jpeg")!)
        landmarkImages.append(UIImage(named: "luleburgazIstasyon.jpg")!)
        landmarkImages.append(UIImage(named: "luleburgazSokuluCami.png")!)
        landmarkImages.append(UIImage(named: "luleburgazTasKopru.jpeg")!)
    
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        //cell.textLabel?.text = "Fhewn"
        var contect = cell.defaultContentConfiguration()
        contect.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = contect
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc"{
            let destinationVc = segue.destination as! DetailsVC
            destinationVc.selectedLandmarkName = chosenLandmarkName
            destinationVc.selectedLandmarkImage = chosenLandmarkImage
            
             
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.fade)
        }
    }
}

