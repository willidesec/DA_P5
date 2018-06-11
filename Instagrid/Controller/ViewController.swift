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
    
    // MARK: - Properties
    private var tag: Int? = nil
    private let imagePickerController = UIImagePickerController()
    private var swipeGestureRecognizer: UISwipeGestureRecognizer?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        displayGrid()
        controllerBehavior()
    }
    
    // MARK: - Methods
    
    func displayGrid() {
        // Square Shadow
        gridView.addShadow()
        
        // Image Corner
        gridView.addViewCorner()
        
        // Shox the grid with the pattern 2 and selected the second layout button
        gridView.displayPattern2()
        layoutButtons[1].isSelected = true
    }
    
    func controllerBehavior() {
        // Add a Swipe gesture to the grid
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gridViewSwiped(_:)))
        guard let swipeGestureRecognizer = swipeGestureRecognizer else { return }
        gridView.addGestureRecognizer(swipeGestureRecognizer)
        
        // Notification when Device's Orientation did change
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        imagePickerController.delegate = self
    }
    
    // A function to change the layout of the grid view
    @IBAction func changeLayout(_ sender: UIButton) {
        layoutButtonNotSelected()
        switch sender.tag {
        case 0:
            gridView.displayPattern1()
            layoutButtons[0].isSelected = true
        case 1:
            gridView.displayPattern2()
            layoutButtons[1].isSelected = true
        case 2:
            gridView.displayPattern3()
            layoutButtons[2].isSelected = true
        default:
            break
        }
    }
    
    // Function to unselected all the layoutButtons
    private func layoutButtonNotSelected() {
        for button in layoutButtons {
            button.isSelected = false
        }
    }
    
    // Function to change the direction of the swipe gesture when the device orientation change
    @objc func deviceOrientationDidChange() {
        let currentOrientation = UIDevice.current.orientation
        if currentOrientation.isLandscape {
            swipeGestureRecognizer?.direction = .left
        } else if currentOrientation.isPortrait {
            swipeGestureRecognizer?.direction = .up
        }
    }
    
    // A function to reset all the images
    @IBAction func resetButtonDidTapped(_ sender: UIButton) {
        gridView.resetImageViews()
        gridView.displayAddButtons()
    }
    
    // A function to remove observer
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - UIGestureRecognizer
    
    @objc private func gridViewSwiped(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            animateSwipe(translationX: -view.frame.width, y: 0)
        } else {
            animateSwipe(translationX: 0, y: -view.frame.height)
        }
        
        if gridView.isAvailableToShare() {
            share()
        } else {
            displaySwipeErrorPopUp()
        }
    }
    
    // MARK: - Animations
    
    private func animateSwipe(translationX x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.gridView.transform = CGAffineTransform(translationX: x, y: y)
        })
    }
    
    private func animateBackToCenter() {
        UIView.animate(withDuration: 0.5) {
            self.gridView.transform = .identity
        }
    }
    
    // MARK: - UIAlertController
    
    private func displaySwipeErrorPopUp() {
        let myAlert = UIAlertController(title: "Oups", message: "Can't share if all the images are not filling", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (Action) in
            myAlert.dismiss(animated: true, completion: nil)
            self.animateBackToCenter()
        }
        
        myAlert.addAction(okAction)
        
        present(myAlert, animated: true, completion: nil)
    }
    
    // MARK: - UIActivityViewController
    
    private func share() {
        guard let image = GridManager.convertGridViewToImage(gridView: gridView) else { return }
        displaySharePopUp(image: image)
    }
    
    private func displaySharePopUp(image: UIImage) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        activityViewController.completionWithItemsHandler = { activity, completed, items, error in
            self.animateBackToCenter()
        }
    }
    
}
    
// MARK: - UIImagePickerController
    
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Add image from Library
    @IBAction func importImage(_ sender: UIButton) {
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
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
            gridView.imageViews[currentTag].addGestureRecognizer(tapRecognizer)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc private func tappedImage(_ sender: UITapGestureRecognizer) {
        imagePickerController.modalPresentationStyle = .overCurrentContext
        imagePickerController.sourceType = .photoLibrary
        tag = sender.view?.tag
        self.present(imagePickerController, animated: true)
    }
}


    


