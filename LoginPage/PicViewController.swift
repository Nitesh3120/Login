//
//  PicViewController.swift
//  LoginPage
//
//  Created by Nitesh Garg on 15/02/23.
//

import UIKit
import PhotosUI
import FAPanels


class PicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

   
    @IBOutlet weak var picview: UIImageView!
    @IBOutlet weak var imgview: UIView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        let alert:UIAlertController=UIAlertController(title: "select your option", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.openCamera(UIImagePickerController.SourceType.camera)
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default) {
            UIAlertAction in
            
            self.openCamera(UIImagePickerController.SourceType.photoLibrary)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera(_ sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
        }
        imagePicker.sourceType = sourceType
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        
        imagePicker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            
            return
        }
        
        picview.image = image
    }
    
    @IBAction func savetap(_ sender: Any) {
        performSegue(withIdentifier: "nextDataPass", sender: nil)
    }
}
