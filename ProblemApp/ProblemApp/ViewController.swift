//
//  ViewController.swift
//  ProblemApp
//
//  Created by Fhewn on 3.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtkilo: UITextField!
    
    
    @IBOutlet weak var lblsonuc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSonuc(_ sender: Any) {
        lblsonuc.text = String(Int(txtkilo.text!)! * 10) 
    }
    
}

