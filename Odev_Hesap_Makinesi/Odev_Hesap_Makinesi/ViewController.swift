//
//  ViewController.swift
//  Odev_Hesap_Makinesi
//
//  Created by Fhewn on 30.09.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtBirinciSayi: UITextField!
    @IBOutlet weak var txtIkinciSayi: UITextField!
    @IBOutlet weak var lblSonuc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func txtToplam(_ sender: Any) {
        
        if let firstNumber = Int(txtBirinciSayi.text!)
        {
            if let secondNumber = Int(txtIkinciSayi.text!){
                
                let sonuc = firstNumber + secondNumber
                lblSonuc.text = String(sonuc)
            }
        }
       
        
        
    }
    
    @IBAction func txtCikarma(_ sender: Any) {
        if let firstNumber = Int(txtBirinciSayi.text!)
        {
            if let secondNumber = Int(txtIkinciSayi.text!){
                
                let sonuc = firstNumber - secondNumber
                lblSonuc.text = String(sonuc)
            }
        }
       
    }
    
    @IBAction func txtCarpma(_ sender: Any) {
        if let firstNumber = Int(txtBirinciSayi.text!)
        {
            if let secondNumber = Int(txtIkinciSayi.text!){
                
                let sonuc = firstNumber * secondNumber
                lblSonuc.text = String(sonuc)
            }
        }
       
    }
    
    
    @IBAction func txtBolme(_ sender: Any) {
        if let firstNumber = Int(txtBirinciSayi.text!)
        {
            if let secondNumber = Int(txtIkinciSayi.text!){
                
                let sonuc = firstNumber / secondNumber
                lblSonuc.text = String(sonuc)
            }
        }
       
    }
    
}

