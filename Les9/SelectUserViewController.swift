//
//  SelectUserViewController.swift
//  Les9
//
//  Created by Bryan on 5/21/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit
import Firebase //53
import FirebaseDatabase //54



class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    //40th
    
    
    
    @IBOutlet weak var tableView: UITableView!   //39th
    
    var users : [User] = [] //48
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self   //41
        self.tableView.delegate = self      //42
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)     //55
            
            let user = User()
            
            user.email = (snapshot.value as! NSDictionary)["email"] as! String
            
            
         
            
            
            user.uid = snapshot.key
        
            self.users.append(user)
            
            self.tableView.reloadData()
            
            
            
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //43
        return users.count  //49
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //44
        
        
        let cell = UITableViewCell()  //50
        
        let user = users[indexPath.row]  //51
        
        cell.textLabel?.text = user.email  //52
        
        
        return cell  //52
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    //53
         let user = users[indexPath.row]  //54
        
        let snap = ["from":user.email, "description":"hello", "imageURL":"www.image.com"]
        
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)                //55
    }
    
    
}


