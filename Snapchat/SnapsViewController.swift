//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import FirebaseAuth

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var snaps : [Snap] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Note the .child(Auth... It's how we retrieve the User ID for each specific Snap
        
        // Snap Added (Child Added)
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childAdded, with: { DataSnapshot in
            
            print(DataSnapshot)
            
            // Utilizing the Snap class!
            
            // Create new Snap
            
            let snap = Snap()
            
            // Get response from FireBase of type NSDictionary
            
            let fireBaseResponse = DataSnapshot.value! as! NSDictionary
            
            // Set values of the Snap object to values in Fire Base
            
            // MAKE SURE THE RESPONSE KEYS ARE EXACT
            // MAKE SURE THE RESPONSE KEYS ARE EXACT
            // MAKE SURE THE RESPONSE KEYS ARE EXACT
            // MAKE SURE THE RESPONSE KEYS ARE EXACT
            // MAKE SURE THE RESPONSE KEYS ARE EXACT
            
            snap.imageURL = fireBaseResponse["imageURL"] as! String
            snap.desc = fireBaseResponse["description"] as! String
            snap.fromEmail = fireBaseResponse["fromEmail"] as! String
            snap.fromUserName = fireBaseResponse["fromUserName"] as! String
            snap.fromUserID = fireBaseResponse["fromUserID"] as! String
            snap.uuid = fireBaseResponse["uuid"] as! String
            snap.key = DataSnapshot.key
            
            // Add Snap to Array
            
            self.snaps.append(snap)
            
            // Reload Data!
            
            self.tableView.reloadData()
        })
        
        // Snaps Removed (Child Removed)
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childRemoved, with: { DataSnapshot in
            
            // print(DataSnapshot)
            
            // Utilizing the Snap class!
            
            var index = 0
            
            for snap in self.snaps {
                
                if snap.key == DataSnapshot.key {
                    
                    self.snaps.remove(at: index)
                    
                }
                
                index += 1
                
            }
            
            self.tableView.reloadData()
            
        })
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // If no snaps in list
        
        if snaps.count == 0 {
            
            tableView.isUserInteractionEnabled = false
            
            return 1
            
        } else {
            
            tableView.isUserInteractionEnabled = true
            
            return snaps.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if snaps.count == 0 {
            
            let cell = UITableViewCell()
            
            cell.textLabel?.text = "Sorry, you have no snaps... :("
            
            return cell
            
        } else {
            
            let cell = UITableViewCell()
            
            let snap = snaps[indexPath.row]
            
            cell.textLabel?.text = snap.fromUserName
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "viewSnapSegue", sender: snap)
        
        
    }
    
    // Logout is just dismissing the current view controller
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "logOutSegue", sender: nil)
        
        // navigationController!.popToViewController(SignInViewController, animated: true)
        
        // dismiss(animated: true, completion: nil)
        
        print("Logged out successfully!")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Since there are multiple segues from the same VC, add IF statements, otherwise Thread 1:signal SIGABRT error will be thrown!
        
        if segue.identifier == "viewSnapSegue" {
            
            let nextVC = segue.destination as! ViewSnapViewController
            
            nextVC.snap = sender as! Snap
            
        }
        
    }
    
    
    
}
