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
    @IBOutlet weak var boundaryOne: UIView!
    @IBOutlet weak var boundaryTwo: UIView!
    @IBOutlet weak var boundaryThree: UIView!
    @IBOutlet weak var boundaryFour: UIView!
    @IBOutlet weak var boundaryFive: UIView!
    @IBOutlet weak var boundarySix: UIView!
    @IBOutlet weak var boundarySeven: UIView!
    @IBOutlet weak var boundaryEight: UIView!
    @IBOutlet weak var boundaryNine: UIView!
    @IBOutlet weak var boundaryTen: UIView!
    @IBOutlet weak var boundaryEleven: UIView!
    @IBOutlet weak var boundaryTwelve: UIView!
   
    var pushBehaviorUno = UIPushBehavior()
    var pushBehaviorDos = UIPushBehavior()
    var pushBehaviorTres = UIPushBehavior()
    var pushBehaviorCuatro = UIPushBehavior()
    let dynamicAnimator = UIDynamicAnimator()
    var boundaryArray = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boundaryArray.append(boundaryOne)
        boundaryArray.append(boundaryTwo)
        boundaryArray.append(boundaryThree)
        boundaryArray.append(boundaryFour)
        boundaryArray.append(boundaryFive)
        boundaryArray.append(boundarySix)
        boundaryArray.append(boundarySeven)
        boundaryArray.append(boundaryEight)
        boundaryArray.append(boundaryNine)
        boundaryArray.append(boundaryTen)
        boundaryArray.append(boundaryEleven)
        boundaryArray.append(boundaryTwelve)
        dynamicActions()
        
    }
    

    func dynamicActions() {
        let dynamicItemBehavior = UIDynamicItemBehavior(items: [blueBlock1, blueBlock2, blueBlock3, blueBlock4, blueBlock5])
        dynamicItemBehavior.density = 1.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicItemBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        let dynamicItemBehaviorTwo = UIDynamicItemBehavior(items: [playBall])
        dynamicItemBehaviorTwo.density = 1
        dynamicItemBehaviorTwo.friction = 0.0
        dynamicItemBehaviorTwo.resistance = 0.0
        dynamicItemBehaviorTwo.elasticity = 0
        dynamicItemBehaviorTwo.allowsRotation = false
        dynamicAnimator.addBehavior(dynamicItemBehaviorTwo)

        let collisionBehavior = UICollisionBehavior(items: [boundaryOne, boundaryTwo, boundaryThree, boundaryFour, boundaryFive, boundarySix, boundarySeven, boundaryEight, boundaryNine, boundaryTen, boundaryEleven, boundaryTwelve, blueBlock1, blueBlock2, blueBlock3, blueBlock4, blueBlock5, playBall])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        for boundary in boundaryArray {
        collisionBehavior.addBoundaryWithIdentifier("\(boundary)", forPath: UIBezierPath(rect: boundary.frame))
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        }
        
        let pushBehavior5 = UIPushBehavior(items: [blueBlock1,blueBlock3,blueBlock5], mode: .Instantaneous)
        pushBehavior5.magnitude = 1.0
        pushBehavior5.pushDirection = CGVectorMake(0, 0.1)
        dynamicAnimator.addBehavior(pushBehavior5)

        let pushBehavior6 = UIPushBehavior(items: [blueBlock2,blueBlock4], mode: .Instantaneous)
        pushBehavior6.magnitude = 1.0
        pushBehavior6.pushDirection = CGVectorMake(0, -0.1)
        dynamicAnimator.addBehavior(pushBehavior6)

        
        
        
    }
    func winLogic() {
        if CGRectContainsRect(endPlatform.frame, playBall.frame) {
            let alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
            alert.title = "CONGRAGULATIONS"
            alert.message = "YOU WIN"
            
            
            
            let defaultAction = UIAlertAction(title: "CLICK TO RESET", style: .Default, handler: nil)
            alert.addAction(defaultAction)
            
            presentViewController(alert, animated: true, completion: nil)
            

        }
    }
    
    
    @IBAction func upButton(sender: UIButton) {
        
        let pushBehavior1 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior1.magnitude = 1.0
        pushBehavior1.pushDirection = CGVectorMake(0, -0.1)
        dynamicAnimator.addBehavior(pushBehavior1)
        self.pushBehaviorUno = pushBehavior1
        print("start")
        

    }
    
    @IBAction func upEnd(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehaviorUno)
        
    }
    
    @IBAction func leftButton(sender: UIButton) {
        
        let pushBehavior2 = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehavior2.magnitude = 1.0
        pushBehavior2.pushDirection = CGVectorMake(-0.1, 0)
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
        print("end")
    }
    
      }
    
   

    

