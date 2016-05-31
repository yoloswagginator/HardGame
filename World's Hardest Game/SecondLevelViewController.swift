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
    
    var deds3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dedsLabel.text = "Deaths: \(deds3)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
