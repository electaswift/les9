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
            snap.key = snapshot.key                //83
            snap.uuid = (snapshot.value as! NSDictionary)["uuid"] as! String  //91
            
            self.snaps.append(snap)
            
            self.tableView.reloadData()
            
            
        })
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childRemoved, with: {(snapshot) in    //85
            print(snapshot)
            
            var index = 0
            for snap in self.snaps {
                if snap.key == snapshot.key {
                    self.snaps.remove(at: index)
                }
                index += 1
            }
            
            self.tableView.reloadData()  //86
            
        })
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  //66, 90
        if snaps.count == 0 {
            return 1
        } else {
            
            return snaps.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //67      //68 is to create the viewing snap vc on storyboard. add label/ image view, 91
        
        
        let cell = UITableViewCell()
        
        if snaps.count != 0 {
            
            let snap = snaps[indexPath.row]
            
            cell.textLabel?.text = snap.from
            
            
        }   else if snaps.count == 0 {
            cell.textLabel?.text = "You have no Snaps 😫"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {  //73rd. 74 is to name the segue.
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "selectSnap", sender: snap)  //75th
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectSnap" {          //cause this vc has two segues
            let nextVC = segue.destination as! SelectSnapViewController   //76th
            nextVC.snap = sender as! Snap
        }
        
    }
    
    @IBAction func logOutTapped(_ sender: Any) {   //  11th
        
        dismiss(animated: true, completion: nil)    //12th dismisses the present modally that just happened from sign in screen.
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
