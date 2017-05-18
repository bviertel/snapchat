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
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    
    
    }
    
    // Log In
    
    @IBAction func signInTapped(_ sender: Any) {
        
        // Takes User and Password from the corresponding text fields, gives back a
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            print("We tried to sign in")
            
            // If error occurs
            
            if error != nil {
                
                print("We have error: \(error)")
                
                // When refering to items in the class, use self.
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    
                    print("We tried to create a user")
                    
                    if error != nil {
                        
                        print("We have error: \(error)")
                     
                    // If everything checks out and able to sign in successfully
                    // Also for segue, do 'show modaly' as to not allow back functionality
                    } else {
                        
                        print("Created user successfully!")
                        
                        // Puts user in database and sets emails and UID. Don't need password as authentication already occured
                        Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email)
                        
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                        
                        
                    }
                    
                })
                
                // Smooth login
                
            } else {
                
                print("Signed in successfully!")
                
                self.performSegue(withIdentifier: "signInSegue", sender: nil)

            }
        }
        
        
    }
    
}

