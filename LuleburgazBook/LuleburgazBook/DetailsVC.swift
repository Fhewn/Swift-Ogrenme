//
//  DetailsVC.swift
//  LuleburgazBook
//
//  Created by Fhewn on 22.10.2025.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var lblluleburgaz: UILabel!
    
    @IBOutlet weak var lblImage: UIImageView!
    
    var selectedLandmarkName = " "
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblluleburgaz.text = selectedLandmarkName
        lblImage.image = selectedLandmarkImage
        
    }
    



}
