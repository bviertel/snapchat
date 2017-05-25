//
//  MainPopUpViewController.swift
//  
//
//  Created by Ann Marie Seyerlein on 5/25/17.
//
//

import UIKit

class MainPopUpViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }

    @IBAction func okButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.view.alpha = 0.0
            
            self.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        })
        
        dismiss(animated: true, completion: {
            
            self.view.removeFromSuperview()
            
        })
    
    }
    
    
}
