//
//  ViewController.swift
//  Instagrid
//
//  Created by William on 18/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate {

    // MARK: - Outlet
    @IBOutlet weak var squareView: GridView!
    @IBOutlet var layoutButtons: [UIButton]!
    
    // MARK: - Var
    var tag: Int? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Square Shadow
        addShadow()
        
        // Image Corner
        squareView.addImageViewCorner()
    }

    // A function to change the layout of the square view
    @IBAction func changeLayout(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            squareView.views[3].isHidden = false
            squareView.views[1].isHidden = true
            layoutButtons[0].isSelected = true
            layoutButtons[1].isSelected = false
            layoutButtons[2].isSelected = false
        case 2:
            squareView.views[1].isHidden = false
            squareView.views[3].isHidden = true
            layoutButtons[1].isSelected = true
            layoutButtons[0].isSelected = false
            layoutButtons[2].isSelected = false
        case 3:
            squareView.views[1].isHidden = false
            squareView.views[3].isHidden = false
            layoutButtons[2].isSelected = true
            layoutButtons[1].isSelected = false
            layoutButtons[0].isSelected = false
        default:
            break
        }
    }
    
   // A function to add a shadow to the Square
    func addShadow() {
        squareView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50).cgColor
        squareView.layer.shadowRadius = 4
        squareView.layer.shadowOpacity = 0.5
        squareView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    // Add image from Library
    @IBAction func importImage(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true)
        tag = sender.tag
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            guard let currentTag = tag else { return }
            squareView.imageViews[currentTag - 4].contentMode = .scaleToFill
            squareView.imageViews[currentTag - 4].image = image
            squareView.addButtons[currentTag - 4].isHidden = true
            
            // Make the ImageView clickable
            let UITapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
            UITapRecognizer.delegate = self
            squareView.imageViews[currentTag - 4].addGestureRecognizer(UITapRecognizer)
            squareView.imageViews[currentTag - 4].isUserInteractionEnabled = true


        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedImage(_ sender: UIImageView) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true)
//        tag = sender.tag
    }
    
}

