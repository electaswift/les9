//
//  SelectUserViewController.swift
//  Les9
//
//  Created by Bryan on 5/21/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    //40th
    
    
    
    @IBOutlet weak var tableView: UITableView!   //39th
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self   //41
        self.tableView.delegate = self      //42
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //43
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //44
        
    }
    

}
