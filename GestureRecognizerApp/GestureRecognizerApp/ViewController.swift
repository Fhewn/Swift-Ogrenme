//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Fhewn on 15.10.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImageView: UIImageView!    
    @IBOutlet weak var txtCars: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ImageView.isUserInteractionEnabled = true
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        ImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
@objc func changePic()
    {
        var Ford = true
        
        if Ford == true
        {
            ImageView.image = UIImage(named: "chevrolet")
            txtCars.text = "Chevrolet"
            Ford = false
        }
        else {
            ImageView.image = UIImage(named: "ford")
            txtCars.text = "Ford"
            Ford = true
        }
        
    }

}

