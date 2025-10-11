//
//  ViewController.swift
//  ObjectsWithCode
//
//  Created by Fhewn on 11.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var Mylabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        myLabel.text = "Text Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: widht * 0.5 - widht * 0.8 / 2, y: height * 0.5 - 50/2, width: widht * 0.8, height: 50)
        view.addSubview(myLabel)
        
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        myButton.frame = CGRect(x: widht * 0.5 - 100 , y: height * 0.6 , width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
    }

    @objc  func myAction(){
        Mylabel.text = "Fhewnexe"
    }
    
}

