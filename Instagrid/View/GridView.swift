//
//  GridView.swift
//  Instagrid
//
//  Created by William on 23/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit


class GridView: UIView {

    // MARK: - Outlet
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var views: [UIView]!
    @IBOutlet var addButtons: [UIButton]!
    
    // MARK: - Methods
    
    // A function to add Corner to ImageViews
    func addViewCorner() {
        for aView in views {
            aView.layer.cornerRadius = 2
        }
    }
    
    // A function to add a shadow to the Square
    func addShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50).cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    // Functions to display the different patterns
    func displayPattern1() {
        views[3].isHidden = false
        views[1].isHidden = true
    }
    
    func displayPattern2() {
        views[1].isHidden = false
        views[3].isHidden = true
    }
    
    func displayPattern3() {
        views[1].isHidden = false
        views[3].isHidden = false
    }
    
    func displayAddButtons() {
        for buttons in addButtons {
            buttons.isHidden = false
        }
    }
    
    func resetImageViews() {
        for image in imageViews {
            image.image = nil
        }
    }
    
    func checkIfImageNil() -> Bool {
        var imageIsEmpty = true
        var numberOfViews = 0
        var numberOfImage = 0
        
        for view in views {
            if !view.isHidden {
                numberOfViews += 1
            }
        }
        print(numberOfViews)
        for image in imageViews {
                if image.image != nil {
                    numberOfImage += 1
                }
            }
        print(numberOfImage)
        
        if numberOfImage >= numberOfViews {
            imageIsEmpty = false
        } else {
            imageIsEmpty = true
        }
        return imageIsEmpty
    }
    
}
