//
//  ViewController.swift
//  Instagrid
//
//  Created by William on 18/04/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareView: gridView!
    @IBOutlet weak var layout1Button: UIButton!
    @IBOutlet weak var layout2Button: UIButton!
    @IBOutlet weak var layout3Button: UIButton!

    
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
    
    // Layout Button
    @IBAction func changeToLayout1(_ sender: UIButton) {
        squareView.imageView4.isHidden = false
        squareView.imageView2.isHidden = true
        
        layout1Button.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
        
        if layout2Button.imageView != nil {
            layout2Button.setImage(nil, for: .normal)
        }

        if layout3Button.imageView != nil {
            layout3Button.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func changeToLayout2(_ sender: UIButton) {
        squareView.imageView2.isHidden = false
        squareView.imageView4.isHidden = true
        
        layout2Button.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)

        if layout1Button.imageView != nil {
            layout1Button.setImage(nil, for: .normal)
        }

        if layout3Button.imageView != nil {
            layout3Button.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func changeToLayout3(_ sender: UIButton) {
        squareView.imageView2.isHidden = false
        squareView.imageView4.isHidden = false
        
        layout3Button.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
        
        if layout2Button.imageView != nil {
            layout2Button.setImage(nil, for: .normal)
        }

        if layout1Button.imageView != nil {
            layout1Button.setImage(nil, for: .normal)
        }
    }
    

    
}

