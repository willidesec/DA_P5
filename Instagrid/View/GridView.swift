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
    
    // A function do add Corner Radius to buttons
    func addImageViewCorner() {
        
        for aImageView in imageViews {
            aImageView.layer.cornerRadius = 2
        }
    }
    

}
