//
//  ViewController.swift
//  Instagrid
//
//  Created by William on 18/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Square Shadow
        squareView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50).cgColor
        squareView.layer.shadowRadius = 4
        squareView.layer.shadowOpacity = 0.5
        squareView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

