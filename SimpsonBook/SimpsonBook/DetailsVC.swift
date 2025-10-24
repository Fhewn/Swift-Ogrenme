//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Fhewn on 24.10.2025.
//

import UIKit

class DetailsVC: UIViewController {

  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.Job
        imageView.image = selectedSimpson?.image
    }
    

   

}
