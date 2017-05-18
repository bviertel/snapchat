//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Ann Marie Seyerlein on 5/18/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

// Need to set up numrowssection and cellforrowat as well as delegate and datasource otherwise error will be thrown

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
    }


}
