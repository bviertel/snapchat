//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Logout is just dismissing the current view controller
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        print("Logged out successfully!")
        
    }


}
