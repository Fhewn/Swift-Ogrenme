//
//  SettingsViewController.swift
//  CakmaInsta
//
//  Created by Gökhan Tuncay on 27.11.2025.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toVC", sender: nil)
        } catch {
            print("Hata!")
        }
    }
    
}
