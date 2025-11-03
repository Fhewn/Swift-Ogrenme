//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Fhewn on 2.11.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changebutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //overrideUserInterfaceStyle = .light
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
         if userInterfaceStyle == .dark{
             changebutton.tintColor = UIColor.white
         }else{
             changebutton.tintColor = UIColor.blue
         }
        
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
         if userInterfaceStyle == .dark{
             changebutton.tintColor = UIColor.white
         }else{
             changebutton.tintColor = UIColor.blue
         }
    }
}

