//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Fhewn on 24.10.2025.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var mySimpson = [Simpson]()
    var chosenSimpson : Simpson?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Simpson Objects
       let Homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "Homer_Simpson")!)
        let Marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "Marge_Simpson")!)
        let Bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Bart_Simpson")!)
        let Lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Lisa_Simpson")!)
        let Maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "Maggie_Simpson")!)

        
        mySimpson.append(Homer)
        mySimpson.append(Marge)
        mySimpson.append(Bart)
        mySimpson.append(Lisa)
        mySimpson.append(Maggie)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpson[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVc = segue.destination as! DetailsVC
            destinationVc.selectedSimpson = chosenSimpson
            
        }
    }

    
}

