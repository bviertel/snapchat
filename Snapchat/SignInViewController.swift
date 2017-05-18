//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Brandon Viertel on 5/17/17.
//  Copyright © 2017 Brandon. All rights reserved.
//
//  In order to use each Firebase kit, you need to import individually!

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Log In
    
    @IBAction func signInTapped(_ sender: Any) {
        
        // Takes User and Password from the corresponding text fields, gives back a
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            print("We tried to sign in")
            
            // If error occurs
            
            if error != nil {
                
                print("We have error: \(error)")
                
                // Smooth login
                
            } else {
                
                print("Signed in successfully!")
            }
        }
        
        
    }
    
}

