//  Lukas Wilke, Logan Shuck, Timmy Somary
//
//  loserViewController.swift
//  World's Hardest Game
//
//  Created by student3 on 5/18/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class loserViewController: UIViewController {
    
    @IBOutlet weak var winOrLoseButton: UILabel!
    
    var labelText = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if labelText == true {
            winOrLoseButton.text = "You Win LOL"
        }
        else {
            winOrLoseButton.text = "You Lose LOL"
        }

    }

    @IBAction func dismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
