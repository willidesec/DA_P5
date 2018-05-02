//
//  GridView.swift
//  Instagrid
//
//  Created by William on 23/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class GridView: UIView {

    // Outlet
    @IBOutlet var ImageViews: [UIImageView]!
    
//     A function do add Corner Radius to buttons
    func addImageViewCorner() {
        
        for aImageView in ImageViews {
            aImageView.layer.cornerRadius = 2
        }
    }
    

}
