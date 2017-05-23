//
//  SnapsViewController.swift
//  Les9
//
//  Created by Bryan on 5/21/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase //61

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {      //66
    
    
    @IBOutlet weak var tableView: UITableView!  //64
    
    var snaps : [Snap] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self        //65
        tableView.delegate = self

      
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childAdded, with: {(snapshot) in    //62
            print(snapshot)
            
          
        
            let snap = Snap()   //63
            
            snap.imageURL = (snapshot.value as! NSDictionary)["imageURL"] as! String
            snap.from = (snapshot.value as! NSDictionary)["from"] as! String
            snap.descrip = (snapshot.value as! NSDictionary)["description"] as! String
        
            
            
            self.snaps.append(snap)
            
            self.tableView.reloadData()
            
        
            })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  //66
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //67      //68 is to create the viewing snap vc on storyboard. add label/ image view
        let cell = UITableViewCell()
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  //73rd. 74 is to name the segue. 
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "selectSnap", sender: snap)  //75th
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SelectSnapViewController   //76th
        nextVC.snap = sender as! Snap        
    }
    
    
    
    @IBAction func logOutTapped(_ sender: Any) {   //  11th
        
        dismiss(animated: true, completion: nil)    //12th dismisses the present modally that just happened from sign in screen. 
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
}
