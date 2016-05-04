//
//  firstLevelViewController.swift
//  World's Hardest Game
//
//  Created by student3 on 4/29/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class firstLevelViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var startPlatform: UIImageView!
    @IBOutlet weak var mainPlatform: UIImageView!
    @IBOutlet weak var endPlatform: UIImageView!
    @IBOutlet weak var playBall: UIView!
    @IBOutlet weak var upButton: UIButton!
    
    let dynamicAnimator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    func dynamicActions(array: [UIView]) {
        let dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 1.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicItemBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)

        
    }
    
    @IBAction func movementButtons(sender: UILongPressGestureRecognizer) {
        
        let point = sender.locationInView(view)
        
        if CGRectContainsPoint(upButton.frame, point) {
            let pushBehavior = UIPushBehavior()
            pushBehavior.magnitude = 1.0
            pushBehavior.pushDirection = CGVectorMake(0, 5)
            dynamicAnimator.addBehavior(pushBehavior)
        }
        
    }
   

    
}
