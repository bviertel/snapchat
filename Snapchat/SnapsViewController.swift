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
        
        
        // Note the .child(Auth... It's how we retrieve the User ID for each specific Snap
        
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
            
            snap.imageURL = fireBaseResponse["ImageURL"] as! String
            snap.desc = fireBaseResponse["Description"] as! String
            snap.from = fireBaseResponse["From"] as! String
            
            // Add Snap to Array
            
            self.snaps.append(snap)
            
            // Reload Data!
            
            self.tableView.reloadData()
        })
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return snaps.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "viewSnapSegue", sender: snap)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Since there are multiple segues from the same VC, add IF statements, otherwise Thread 1:signal SIGABRT error will be thrown!
        
        if segue.identifier == "viewSnapSegue" {
            
            let nextVC = segue.destination as! ViewSnapViewController
            
            nextVC.snap = sender as! Snap
            
        } 
        
    }
    
    // Logout is just dismissing the current view controller
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        print("Logged out successfully!")
        
    }
    
    
    
}
