//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Fhewn on 3.11.2025.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var lblonay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSignIn(_ sender: Any) {
        
        let autoContext = LAContext()
        var error : NSError?
        
        if autoContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            autoContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason:"Is it you ?") { success, error in
                if success == true{
                    //successful auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVc", sender: nil)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.lblonay.text = "Error!"
                    }
                }
                }
            }
        }
        
    }
    

