//
//  ViewController.swift
//  ImageRecognizerApp
//
//  Created by Gökhan Tuncay on 30.10.2025.
//

import UIKit
import PhotosUI
import CoreML
import Vision

class ViewController: UIViewController, PHPickerViewControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    var configuration = PHPickerConfiguration()
    var chosenImage = CIImage()
    var modelConfiguration = MLModelConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectOnClick(_ sender: Any) {
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        configuration.selectionLimit = 1
        configuration.filter = .images
    }
        
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]){
        picker.dismiss(animated: true, completion: nil)
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            let imageView = UIImageView(image: image)
                            imageView.frame = CGRect(x: 50, y:200, width: 300, height: 300)
                            self?.view.addSubview(imageView)
                            if let ciImage = CIImage(image: image) {
                                self!.chosenImage = ciImage
                            }
                        }
                    }
                }
            }
        }
        recognizeImage(image: chosenImage)
    }
    
    func recognizeImage(image: CIImage){
        //Imajı tahmin etmek için request ve handler yazılacak
        if let model = try? VNCoreMLModel(for: MobileNetV2(configuration: modelConfiguration).model) {
            let request = VNCoreMLRequest(model: model) {vnRequest, error in
                if let results = vnRequest.results as? [VNClassificationObservation]{
                    if results.count > 0 {
                        let topResult = results.first
                        DispatchQueue.main.async {
                            let confidenceLevel = (topResult?.confidence ?? 0) * 100
                            let rounded = String(format: "%.2f",confidenceLevel)
                            self.resultLabel.text = "\(rounded)% it is \(topResult!.identifier)"
                        }
                    }
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
                DispatchQueue.global(qos: .userInteractive).async {
                    do {
                        try handler.perform([request])
                    } catch {
                        print("Error: \(error)")
                    }
            }
        }
    }
}

