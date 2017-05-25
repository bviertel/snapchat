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
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var xButton: UIButton!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = snap.desc
        
        imageView.sd_setImage(with: URL(string: snap.imageURL))
        
        navBar.title = "From: \(snap.fromUserName)"

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        Storage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            
            print("Delete Successful")
            
        }
        
        // print("Goodbye")
        
    }
    
    @IBAction func xTapped(_ sender: Any) {
        
        Database.database().reference().child("users").child(snap.fromUserID).child("votes").observeSingleEvent(of: DataEventType.value, with: { DataSnapshot in
            
            print(DataSnapshot)
            
            let fBR = DataSnapshot.value! as? NSDictionary
            
            let dV = fBR!["down"] as! String
            
            var dVI : Int! = Int(dV)
            
            dVI = dVI + 1
            
            print(dVI)
            
            Database.database().reference().child("users").child(self.snap.fromUserID).child("votes").child("down").setValue("\(dVI!)")
            
            
        }) { (Error) in
            
        }

        navigationController!.popViewController(animated: true)

    }
    
    @IBAction func checkTapped(_ sender: Any) {
        
        Database.database().reference().child("users").child(snap.fromUserID).child("votes").observeSingleEvent(of: DataEventType.value, with: { DataSnapshot in
            
            print(DataSnapshot)
            
            let fBR = DataSnapshot.value! as? NSDictionary
            
            let dV = fBR!["up"] as! String
            
            var dVI : Int! = Int(dV)
            
            dVI = dVI + 1
            
            print(dVI)
            
            Database.database().reference().child("users").child(self.snap.fromUserID).child("votes").child("up").setValue("\(dVI!)")
            
            
        }) { (Error) in
            
        }
        
        navigationController!.popViewController(animated: true)

    }

}
