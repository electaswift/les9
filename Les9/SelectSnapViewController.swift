//
//  SelectSnapViewController.swift
//  Les9
//
//  Created by Bryan on 5/23/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit
import SDWebImage


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


    
    
    
    
    
    
    

}




//78 to get the image from imageURL, go to cocoapods.org, get SDWebImage.  go to podfile. enter pod 'SDWebImage'. go back to terminal and pod install
