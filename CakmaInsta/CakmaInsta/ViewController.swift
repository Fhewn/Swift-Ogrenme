//
//  ViewController.swift
//  CakmaInsta
//
//  Created by Gökhan Tuncay on 27.11.2025.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {(authData, error) in
            if error != nil {
                    self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Bilinmeyen Hata!")
            } else {
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
            }
        } else {
            makeAlert(titleInput: "Hata!", messageInput: "Email veya Parola boş bırakılamaz!")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) {(authData, error) in
            if error != nil {
                    self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Bilinmeyen Hata!")
            } else {
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            }
            }
        } else {
            makeAlert(titleInput: "Hata!", messageInput: "Email veya Parola boş bırakılamaz!")
        }
    }
    
    func makeAlert (titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

