//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Fhewn on 11.10.2025.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtBirthday: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblBirthday: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storeName = UserDefaults.standard.object(forKey: "Name")
        let storeBirthaday = UserDefaults.standard.object(forKey: "Birthday")
        
        //Casting -as? vs as! ? kısmen ! yüzde yüz
        if let myName = storeName as? String {
            
            lblName.text = "Name: \(myName)"
        }
        if let myBirthday = storeBirthaday as? String{
            
            lblBirthday.text = "Birthday: \(myBirthday)"
        }
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        UserDefaults.standard.set(txtName.text! , forKey: "Name")
        UserDefaults.standard.set(txtBirthday.text!, forKey: "Birthday")
        
        
        lblName.text = "Name: \(txtName.text!)"
        lblBirthday.text = "Birthday: \(txtBirthday.text!)"
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        
        let storeName = UserDefaults.standard.object(forKey: "Name")
        let storeBirthday = UserDefaults.standard.object(forKey: "Birthday")
        
        if let myName = storeName as? String{
            UserDefaults.standard.removeObject(forKey: "Name")
            lblName.text = "Name"
            
        }
        if let myBirthday = storeBirthday as? String{
            UserDefaults.standard.removeObject(forKey: "Birthday")
            lblBirthday.text = "Birthday"
        }
       
    }
    
}

