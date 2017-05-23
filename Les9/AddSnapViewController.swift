//
//  AddSnapViewController.swift
//
//
//  Created by Bryan on 5/21/17.
//
//

import UIKit
import Firebase //32
import FirebaseStorage  //32

class AddSnapViewController: UIViewController, UIImagePickerControllerDelegate,   UINavigationControllerDelegate { //2nd
    
    
    @IBOutlet weak var imageView: UIImageView!   //16th
    
    
    @IBOutlet weak var descriptionField: UITextField!  //17th
    
    
    
    @IBOutlet weak var nextButton: UIButton!   //19th
    
    var imagePicker = UIImagePickerController()   //20th
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self     //21st
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {   //25th
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear        //28th
        
        imagePicker.dismiss(animated: true, completion: nil)  //27th
    }
    
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {    //15th
        
        present(imagePicker, animated: true, completion: nil)  //23rd
        
        imagePicker.sourceType = .savedPhotosAlbum  //24th  to prevent crashing
        imagePicker.allowsEditing = false //24th optional
        
        //26th click on info.plist. information property list. plus button.  privacy camera usage.
        
        
    }
    
    
    
    
    @IBAction func nextTapped(_ sender: Any) {  //18th
        
        nextButton.isEnabled = false // 36th
        
        let imagesFolder = Storage.storage().reference().child("images")    //33rd
        
        let imageData = UIImageJPEGRepresentation((imageView.image!), 0.1)!                    //35th  UIImagePNGRepresentation(imageView.image!)
        
        
        
        
        
        imagesFolder.child("\( NSUUID().uuidString).jpg").putData(imageData, metadata: nil) { (metadata, error) in   //34th      nsuuid uuidstring gives back a new string
            print("We tried to upload")
            if error != nil {
                print("We had an error.  \(error)")
            } else {
                
                print(metadata?.downloadURL())    //37th
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: metadata?.downloadURL()!.absoluteString)    //30th   //59 add sender from nil to metadata. turns URL into string absolute.
            }
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {    //32nd
        
        let nextVC = segue.destination as! SelectUserViewController   //58
        nextVC.imageURL = sender as! String   //60
        nextVC.descrip = descriptionField.text!
        
    }
    
}
