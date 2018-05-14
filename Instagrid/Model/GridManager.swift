//
//  GridManager.swift
//  Instagrid
//
//  Created by William on 14/05/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit
import Foundation

class GridManager {
    static func convertGridViewToImage(gridView: GridView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(gridView.bounds.size, gridView.isOpaque, 0.0)
        gridView.drawHierarchy(in: gridView.bounds, afterScreenUpdates: true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
