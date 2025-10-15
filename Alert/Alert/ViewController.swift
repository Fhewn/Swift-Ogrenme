//
//  ViewController.swift
//  Alert
//
//  Created by Fhewn on 15.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet weak var txtpaswordagain: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnsignup(_ sender: Any) {
        /*
        let alert = UIAlertController(title: "Error !", message: "UserName not found!", preferredStyle: UIAlertController.Style.alert)
        let okeyButton = UIAlertAction(title: "Okey" , style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("button clicked")
        }//handler butona bişi yapılmasını istermisin
        alert.addAction(okeyButton)
        self.present(alert , animated: true , completion: nil)
         */
        
        if txtusername.text == ""{
            /*
            let alert =  UIAlertController(title:"Error!", message:"UserName not found", preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
            */
            makeAlert(titleInput: "Error!", messageInput: "UserName not found")
        }
        else if txtpassword.text == ""{
            /*
            let alert =  UIAlertController(title:"Error!", message:"Password not found", preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
            */
            makeAlert(titleInput: "Error! ", messageInput: "Password not found")
            
        }
        else if txtpassword.text != txtpaswordagain.text{
            /*
            let alert =  UIAlertController(title:"Error!", message:"Password do not match", preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
             */
            makeAlert(titleInput: "Error!", messageInput: "Password do not match")
            
        }
        else {
            /*
            let alert =  UIAlertController(title:"Sucsess!", message:"User Okey", preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
             */
            makeAlert(titleInput: "Succses", messageInput: "User Okey")
        }
        
        func makeAlert(titleInput: String , messageInput: String)
        {
            let alert =  UIAlertController(title:titleInput, message:messageInput , preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okeyButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

