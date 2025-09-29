//
//  ViewController.swift
//  FirstApp
//
//  Created by Fhewn on 29.09.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView1: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func DegistirButton1(_ sender: Any) {
        ImageView1.image = UIImage(named: "hardcorsa")
    }
    
}

