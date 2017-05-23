//
//  SelectSnapViewController.swift
//  Les9
//
//  Created by Bryan on 5/23/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase //81
import FirebaseDatabase
import FirebaseAuth



class SelectSnapViewController: UIViewController {     //69 this was made 69th
    
    
    var snap = Snap()    //72nd
    
    
    @IBOutlet weak var imageView: UIImageView!   //70th
    
    
    @IBOutlet weak var label: UILabel!     //71st
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = snap.descrip   //77th
        
        imageView.sd_setImage(with: URL(string: snap.imageURL))      //79th
        
        imageView.backgroundColor = UIColor.clear  //79th actuall not necessary caause it fills up
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {   //80
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").child(snap.key).removeValue()   //82, 84
    }
    
    
    
    
    
    
    
}




//78 to get the image from imageURL, go to cocoapods.org, get SDWebImage.  go to podfile. enter pod 'SDWebImage'. go back to terminal and pod install
