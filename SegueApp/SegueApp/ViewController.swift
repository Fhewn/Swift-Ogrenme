//
//  ViewController.swift
//  SegueApp
//
//  Created by Fhewn on 11.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtlabel1: UINavigationItem!
    
    var UserName = ""
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidDisappear func called")
        
        // Do any additional setup after loading the view.
    }
///kayboldu manasına gelir

    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDisappear func called")
    }
    //kaybolacak
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWillDisappear func called")
    }
    // bu görünüm belirlenecek
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear func called")
        txtUserName.text = " "
    }
    // görünüm gözüktü
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear func called")
    }
    
    @IBAction func btnNext(_ sender: Any) {
        UserName = txtUserName.text!
        performSegue(withIdentifier: "ToSecondView", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondView" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.MyName = UserName
        }
        
    }
    
}

