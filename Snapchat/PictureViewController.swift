//
//  PictureViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        imagePicker.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    // We need the following code for any image, whether it be from the photo library or directly from the camera!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        // Set back to camera for completed product
        // Set to photo library for ease and simplicity
        
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }
}
