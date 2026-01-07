//
//  UploadViewController.swift
//  CakmaInsta
//
//  Created by Gökhan Tuncay on 27.11.2025.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class UploadViewController: UIViewController, PHPickerViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    
    var configuration = PHPickerConfiguration()
    let viewController = ViewController()
    
    @IBOutlet weak var uploadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseImage() {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        configuration.selectionLimit = 1
        configuration.filter = .images
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self?.imageView.image = image
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    self.viewController.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Bilinmeyen Hata!")
                } else {
                    imageReference.downloadURL { url, error in
                        if error != nil {
                            self.viewController.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Bilinmeyen Hata!")
                        } else {
                            let imageURL = url?.absoluteString
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            let firestorePost = ["imageUrl": imageURL!, "postedBy": Auth.auth().currentUser!.email!, "postComment": self.commentText.text!, "date": FieldValue.serverTimestamp(), "likes": 0] as [String: Any]
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: {(error) in
                                if error != nil {
                                    self.viewController.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Bilinmeyen Hata!")
                                } else {
                                    self.imageView.image = UIImage(named: "tap.png")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                        }
                        
                    }
                }
                
            }
        }
    }
    
}
