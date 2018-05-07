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
    func addImageViewCorner() {
        for aImageView in imageViews {
            aImageView.layer.cornerRadius = 2
        }
    }
    
    // Functions to display the different patterns
    func displayPatter1() {
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
    

}
