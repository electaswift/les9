//
//  ViewController.swift
//  Les9
//
//  Created by Bryan on 5/20/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit
import Firebase   //3rd
import FirebaseAuth  //4th

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  

    
    @IBAction func signTapped(_ sender: Any) { //5th
        
   Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (User, error) in                      //last part completion is a kind of "func" with user/error as the parameters.  Auth is class. auth() is the func that returns the objects. signIn is the method within the class. i think..
    if error != nil {
        print("\(error!)")
        
        Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
            if error != nil {
                print("\(error!)")
            } else {
                print("Created User Account")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)    //8th
                
                
                
            }
        })
        
        
        
    } else {
        print("Signed In!")
         self.performSegue(withIdentifier: "signInSegue", sender: nil)   //8th
    }
        }

        
        
        
    }
    
    
    
    

}





//1st create labels, connect to code
/*2nd add pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'Firebase/Storage'
 //6th create new view controller. embed in navigation controller. 
 //7th create segue from signIn vc to navigation controller. yellow circle drag. name the segue. make sure its present modally. 
 //9th add bar button item to 2nd vc bar. 
 //10th create code vc for 2nd vc. new file cocoa touch . yellow circle change class to SnapsViewController
 //11th connect log out bar button to code vc as action. 
 //12th add add button. connect to 3rd vc. add navigation item to 3rd vc. add camera. 
 //13th add image view to 3rd vc
 //14th add 3rd vc code version
 
 
 
 
 
 */
