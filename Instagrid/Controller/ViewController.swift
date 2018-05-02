//
//  ViewController.swift
//  Instagrid
//
//  Created by William on 18/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // MARK: - Outlet
    @IBOutlet weak var squareView: GridView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Square Shadow
//        addShadow()
        
        // Image Corner
        
    }


    
    
    
    
    
    
    // Layout Buttons
//    @IBAction func changeLayout(_ sender: UIButton) {
//        if sender.tag == 5 {
//            squareView.imageView4.isHidden = false
//            squareView.imageView2.isHidden = true
//
//        }
//
//        if sender.tag == 6 {
//            squareView.imageView2.isHidden = false
//            squareView.imageView4.isHidden = true
//            layout2Button.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
//            if layout1Button.imageView != nil {
//                layout1Button.setImage(nil, for: .normal)
//            }
//            if layout3Button.imageView != nil {
//                layout3Button.setImage(nil, for: .normal)
//            }
//        }
//
//        if sender.tag == 7 {
//            squareView.imageView2.isHidden = false
//            squareView.imageView4.isHidden = false
//            layout3Button.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
//            if layout2Button.imageView != nil {
//                layout2Button.setImage(nil, for: .normal)
//            }
//            if layout1Button.imageView != nil {
//                layout1Button.setImage(nil, for: .normal)
//            }
//        }
//    }
//
//
//    // A function to add a shadow to the Square
//    func addShadow() {
//        squareView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50).cgColor
//        squareView.layer.shadowRadius = 4
//        squareView.layer.shadowOpacity = 0.5
//        squareView.layer.shadowOffset = CGSize(width: 0, height: 2)
//    }
//
//    // Add Image from librairy
//    @IBAction func importImage(_ sender: UIButton) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary
//
//        // En plus pour l'instant
//        imagePickerController.allowsEditing = false
//
//        self.present(imagePickerController, animated: true)
//
//
//
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            squareView.imageView1.image = image
//        } else {
//            // Error message
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
//
//
}

