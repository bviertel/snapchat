//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/18/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit
import SDWebImage

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = snap.desc
        
        imageView.sd_setImage(with: URL(string: snap.imageURL))
        
    }

}
