//
//  ViewController.swift
//  Instagrid
//
//  Created by William on 18/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var gridView: GridView!
    @IBOutlet var layoutButtons: [UIButton]!
    
    // MARK: - Var
    var tag: Int? = nil
    let imagePickerController = UIImagePickerController()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Square Shadow
        addShadow()
        
        // Image Corner
        gridView.addImageViewCorner()
    }

    // MARK: - Methods
    
    // A function to change the layout of the square view
    @IBAction func changeLayout(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            gridView.displayPatter1()
            layoutButtonNotSelected()
            layoutButtons[0].isSelected = true
        case 2:
            gridView.displayPattern2()
            layoutButtonNotSelected()
            layoutButtons[1].isSelected = true
        case 3:
            gridView.displayPattern3()
            layoutButtonNotSelected()
            layoutButtons[2].isSelected = true
        default:
            break
        }
    }
    
    // Function to unselected all the layoutButtons
    func layoutButtonNotSelected() {
        for button in layoutButtons {
            button.isSelected = false
        }
    }
    
   // A function to add a shadow to the Square
    func addShadow() {
        gridView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50).cgColor
        gridView.layer.shadowRadius = 4
        gridView.layer.shadowOpacity = 0.5
        gridView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}

    
// MARK: - UIImagePickerController
    
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Add image from Library
    @IBAction func importImage(_ sender: UIButton) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        tag = sender.tag
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            guard let currentTag = tag else { return }
            gridView.imageViews[currentTag].image = image
            gridView.addButtons[currentTag].isHidden = true
            
            // Make the ImageView clickable
            let UITapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
            gridView.imageViews[currentTag].addGestureRecognizer(UITapRecognizer)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedImage(_ sender: UITapGestureRecognizer) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        tag = sender.view?.tag
        self.present(imagePickerController, animated: true)
    }
}
    


