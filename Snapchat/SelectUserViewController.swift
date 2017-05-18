//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/18/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

// Need to set up numrowssection and cellforrowat as well as delegate and datasource otherwise error will be thrown

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
          
            // Populate Table View after Picture has been selected from the Picture View Controller
            // Observe allows us to get the data or look at it
            // NOTE THE FORMAT WITH OBSERVE!!!! BUG IN SYSTEM? WEIRD...
        
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: { DataSnapshot in
       
            print(DataSnapshot)
            
            // Gets the value specified from the dictionary key
            
            let user = User()
            
            // *** Should check to see if 'nil' first ***

            // Create a Response Variable to hold the DataSnapChat response from Fire Base
            
            let fireBaseResponse = DataSnapshot.value! as! NSDictionary
            
            // Have to specify to String
            // Note optional items (!,?)
            
            // Set User Email to Email Value as String from the Fire Base Response
            
            user.email = fireBaseResponse["email"] as! String

            // Set User ID to the Key of the DataSnapShot, does NOT need to be from the Fire Base Response
            
            user.uid = DataSnapshot.key
            
            // Add user to array in local program
            
            // Self because it's inside a completion block
            
            self.users.append(user)
            
            // Reload the Table View to show Users
            
            self.tableView.reloadData()
            
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        // Gets information from the User class that we made!
        
        cell.textLabel?.text = user.email
        
        return cell
        
        
    }


}
