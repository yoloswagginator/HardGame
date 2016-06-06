//
//  SecondLevelViewController.swift
//  World's Hardest Game
//
//  Created by student3 on 5/27/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class SecondLevelViewController: UIViewController {

    @IBOutlet weak var dedsLabel: UILabel!
    
    var mushroom = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dedsLabel.text = "Deaths: \(mushroom)"
        
    }

}
