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
    @IBOutlet weak var blueBlock1: UIView!
    @IBOutlet weak var blueBlock2: UIView!
    @IBOutlet weak var blueBlock3: UIView!
    @IBOutlet weak var blueBlock4: UIView!
    @IBOutlet weak var blueBlock5: UIView!
   
    
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
    
    @IBAction func upButton(sender: UIButton) {
        
        let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0, -0.1)
        dynamicAnimator.addBehavior(pushBehavior)
        

    }
    
    @IBAction func leftButton(sender: UIButton) {
        
        let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(-0.1, -0)
        dynamicAnimator.addBehavior(pushBehavior)

    }
    
    @IBAction func downButton(sender: UIButton) {
        
        let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0, 0.1)
        dynamicAnimator.addBehavior(pushBehavior)

    }
    
    @IBAction func rightButton(sender: UIButton) {
        
        let pushBehavior = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0.1, 0)
        dynamicAnimator.addBehavior(pushBehavior)

        
    }
    
      }
    
   

    

