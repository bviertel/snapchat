//
//  CreateUserViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/20/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUserViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    @IBAction func createTapped(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            
            print("Attempted Create User")
            
            if error != nil {
                
                print("ERROR: \(String(describing: error))")

            } else {
                
                print("Created user successfully!")
                Database.database().reference().child("users").child(user!.uid).child("email").setValue(user?.email)
                Database.database().reference().child("users").child(user!.uid).child("username").setValue(self.userNameTextField.text!)
                Database.database().reference().child("users").child(user!.uid).child("votes").child("up").setValue("0")
                Database.database().reference().child("users").child(user!.uid).child("votes").child("down").setValue("0")
                
                
                
                self.performSegue(withIdentifier: "createUserSignInSegue", sender: nil)
            
            }
            
        })
        
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
