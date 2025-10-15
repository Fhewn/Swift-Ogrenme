//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Fhewn on 11.10.2025.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var lblSecondView: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    var MyName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = MyName

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
