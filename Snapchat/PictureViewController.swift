//
//  PictureViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth



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
        
        // Because we have a gray background in our original ImageView to show that there IS a spot for a picture, we need to change it back to transparent so that we don't have any gray edges if the picture isn't the same size
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        
        // Disables button while processing upload
        
        self.nextButton.isEnabled = false
        
        // Reference to the image folder in Firebase storage
        
        let imagesFolder = Storage.storage().reference().child("images")
        
        // Turns image into data
        
        //let imageData = UIImagePNGRepresentation(imageView.image!)!
        
        // Change to JPG instead
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        // Creates the file with a NSUUID (Unique ID) converted to String and puts it in the images folder in Firebase
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil) { (metadata, error) in
            
            print("Upload Attempted")
            
            if error != nil {
                
                print("ERROR: \(error)")
                
            } else {
                
                print("Upload Successful")

                // Path to file
                
                print(metadata?.downloadURL())
                
                // If no errors, THEN perform the segue
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            
            }
        }
        
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        // Set back to camera for completed product
        // Set to photo library for ease and simplicity
        
        imagePicker.sourceType = .photoLibrary
        
        // By default, when a picture is selected it would go to the editing screen
        
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 

    }
}
