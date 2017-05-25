//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/18/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = snap.desc
        
        imageView.sd_setImage(with: URL(string: snap.imageURL))
        
        navBar.title = "From: \(snap.from)"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        Storage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            
            print("We deleted the pic!")
            
        }
        
        // print("Goodbye")
        
    }

}
