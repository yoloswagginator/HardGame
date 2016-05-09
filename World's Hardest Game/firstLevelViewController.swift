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
    @IBOutlet weak var yellowBlock1: UIView!
    @IBOutlet weak var yellowBlock2: UIView!
   
    var pushBehaviorUno = UIPushBehavior()
    var pushBehaviorDos = UIPushBehavior()
    var pushBehaviorTres = UIPushBehavior()
    var pushBehaviorCuatro = UIPushBehavior()
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
        
        let pushBehavior1 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior1.magnitude = 1.0
        pushBehavior1.pushDirection = CGVectorMake(0, -0.1)
        dynamicAnimator.addBehavior(pushBehavior1)
        self.pushBehaviorUno = pushBehavior1
        

    }
    
    @IBAction func upEnd(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehaviorUno)
    }
    
    @IBAction func leftButton(sender: UIButton) {
        
        let pushBehavior2 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior2.magnitude = 1.0
        pushBehavior2.pushDirection = CGVectorMake(-0.1, -0)
        dynamicAnimator.addBehavior(pushBehavior2)
        self.pushBehaviorDos = pushBehavior2

    }
    
    @IBAction func leftEnd(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehaviorDos)
    }
    
    @IBAction func downButton(sender: UIButton) {
        
        let pushBehavior3 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior3.magnitude = 1.0
        pushBehavior3.pushDirection = CGVectorMake(0, 0.1)
        dynamicAnimator.addBehavior(pushBehavior3)
        self.pushBehaviorTres = pushBehavior3

    }
    
    @IBAction func downEnd(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehaviorTres)
    }
    
    @IBAction func rightButton(sender: UIButton) {
        
        let pushBehavior4 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior4.magnitude = 1.0
        pushBehavior4.pushDirection = CGVectorMake(0.1, 0)
        dynamicAnimator.addBehavior(pushBehavior4)
        self.pushBehaviorCuatro = pushBehavior4

        
    }
    
    @IBAction func rightEnd(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehaviorCuatro)
    }
      }
    
   

    

