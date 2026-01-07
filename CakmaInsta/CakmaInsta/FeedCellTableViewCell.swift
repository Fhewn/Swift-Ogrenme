//
//  FeedCellTableViewCell.swift
//  CakmaInsta
//
//  Created by Gökhan Tuncay on 4.12.2025.
//

import UIKit
import FirebaseFirestore

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeOnClick(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes": likeCount + 1] as [String : Any]
            firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
    }
}
