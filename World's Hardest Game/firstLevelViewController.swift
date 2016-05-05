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
    @IBOutlet weak var blueBlock1: UIView!
    @IBOutlet weak var blueBlock2: UIView!
    @IBOutlet weak var blueBlock3: UIView!
    @IBOutlet weak var blueBlock4: UIView!
    @IBOutlet weak var blueBlock5: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
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
    @IBAction func upButtonPressed(sender: UILongPressGestureRecognizer) {
        
        sender.minimumPressDuration = 0.0000001
        
        let point = sender.locationInView(view)
        if CGRectContainsPoint(upButton.frame, point) {
            let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
            pushBehavior.magnitude = 1.0
            pushBehavior.pushDirection = CGVectorMake(0, -0.1)
            dynamicAnimator.addBehavior(pushBehavior)
        }
    }
    

    @IBAction func leftButtonPressed(sender: UILongPressGestureRecognizer) {
        
        sender.minimumPressDuration = 0.0000001
        
        let point = sender.locationInView(view)
        if CGRectContainsPoint(leftButton.frame, point) {
            let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
            pushBehavior.magnitude = 1.0
            pushBehavior.pushDirection = CGVectorMake(-0.1, 0)
            dynamicAnimator.addBehavior(pushBehavior)
        }
    }
    
    @IBAction func downButtonPressed(sender: UILongPressGestureRecognizer) {
        
        sender.minimumPressDuration = 0.0000001
        
        let point = sender.locationInView(view)
        if CGRectContainsPoint(downButton.frame, point) {
            let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
            pushBehavior.magnitude = 1.0
            pushBehavior.pushDirection = CGVectorMake(0, 0.1)
            dynamicAnimator.addBehavior(pushBehavior)
        }
    }
        
    @IBAction func rightButtonPressed(sender: UILongPressGestureRecognizer) {
        
        sender.minimumPressDuration = 0.0000001
        
        let point = sender.locationInView(view)
        if CGRectContainsPoint(rightButton.frame, point) {
            let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
            pushBehavior.magnitude = 1.0
            pushBehavior.pushDirection = CGVectorMake(0.1, 0)
            dynamicAnimator.addBehavior(pushBehavior)
        }
    }
        
    }
    
   

    

