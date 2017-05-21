//
//  AddSnapViewController.swift
//  
//
//  Created by Bryan on 5/21/17.
//
//

import UIKit

class AddSnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!   //16th
    
    
    @IBOutlet weak var descriptionField: UITextField!  //17th
    
    
    
    @IBOutlet weak var nextButton: UIButton!   //19th
    
    var imagePicker = UIImagePickerController()   //20th
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
        
        
        
        
        
        
        
    }

 
    
    
    @IBAction func cameraTapped(_ sender: Any) {    //15th
        
        imagePicker.sourceType = .camera   //21st
        
        //22nd click on info.plist. information property list. plus button.  privacy camera usage.
        
        
    }
    
    
    
    
    @IBAction func nextTapped(_ sender: Any) {  //18th
    }
    
    
    
    
    
    

}
