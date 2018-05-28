//
//  UIImagePickerController.swift
//  Instagrid
//
//  Created by William on 21/05/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

extension UIImagePickerController {
    open override var shouldAutorotate: Bool { return true }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }
}
