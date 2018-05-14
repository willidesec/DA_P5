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
    
}
