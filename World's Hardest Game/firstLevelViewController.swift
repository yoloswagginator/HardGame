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
    
    var addBehaviors = false
    var atAWall = false
    var cb = UICollisionBehavior()
    var cb2 = UICollisionBehavior()
    var db = UIDynamicItemBehavior()
    var cbBall = UICollisionBehavior()
    var dbBall = UIDynamicItemBehavior()
    var pushBehaviorUno = UIPushBehavior()
    var pushBehaviorDos = UIPushBehavior()
    var pushBehaviorTres = UIPushBehavior()
    var pushBehaviorCuatro = UIPushBehavior()
    let dynamicAnimator = UIDynamicAnimator()
    var boundaryArray = [UIView]()
    var blockArray = [UIView]()
    var winArray = [UIView]()
    var allowWinning = false
    
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
        blockArray.append(yellowBlock1)
        blockArray.append(yellowBlock2)
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

        self.dbBall = UIDynamicItemBehavior(items: [playBall])
        dbBall.density = 100
        dbBall.friction = 0.0
        dbBall.resistance = 0.0
        dbBall.elasticity = 0
        dbBall.allowsRotation = false
        dynamicAnimator.addBehavior(dbBall)
        
        self.db = UIDynamicItemBehavior(items: [yellowBlock1,yellowBlock1])
        db.density = 1
        db.friction = 0.0
        db.resistance = 0.0
        db.elasticity = 0
        db.allowsRotation = false
        dynamicAnimator.addBehavior(db)
        
        let dynamicItemBehaviorThree = UIDynamicItemBehavior(items: [boundaryOne, boundaryTwo, boundaryThree, boundaryFour, boundaryFive, boundarySix, boundarySeven, boundaryEight, boundaryNine, boundaryTen, boundaryEleven, boundaryTwelve])
        dynamicItemBehaviorThree.elasticity = 0
        dynamicItemBehavior.density = 10
        dynamicAnimator.addBehavior(dynamicItemBehaviorThree)

        self.cb = UICollisionBehavior(items: [playBall, boundaryOne, boundaryTwo, boundaryThree, boundaryFour, boundaryFive, boundarySix, boundarySeven, boundaryEight, boundaryNine, boundaryTen, boundaryEleven, boundaryTwelve, blueBlock1, blueBlock2, blueBlock3, blueBlock4, blueBlock5])
        cb.translatesReferenceBoundsIntoBoundary = true
        for boundary in boundaryArray {
        cb.addBoundaryWithIdentifier("\(boundary)", forPath: UIBezierPath(rect: boundary.frame))
            cb.collisionMode = .Everything
        cb.collisionDelegate = self
        dynamicAnimator.addBehavior(cb)
        }
        
        self.cb2 = UICollisionBehavior(items: [playBall,yellowBlock1,yellowBlock2])
        cb2.translatesReferenceBoundsIntoBoundary = true
        cb2.collisionMode = .Everything
        cb2.collisionDelegate = self
        dynamicAnimator.addBehavior(cb2)
        
        let pushBehavior5 = UIPushBehavior(items: [blueBlock1,blueBlock3,blueBlock5], mode: .Instantaneous)
        pushBehavior5.magnitude = 1.0
        pushBehavior5.angle = -3.14/2
        dynamicAnimator.addBehavior(pushBehavior5)

        let pushBehavior6 = UIPushBehavior(items: [blueBlock2,blueBlock4], mode: .Instantaneous)
        pushBehavior6.magnitude = 1.0
        pushBehavior6.angle = 3.14/2
        dynamicAnimator.addBehavior(pushBehavior6)

        
        
        
    }
    func winLogic() {
        if CGRectContainsRect(endPlatform.frame, playBall.frame) == true && allowWinning == true{
            let alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
            alert.title = "CONGRAGULATIONS"
            alert.message = "YOU WIN"
            
            
            
            let defaultAction = UIAlertAction(title: "CLICK TO RESET", style: .Default, handler: nil)
            alert.addAction(defaultAction)
        
            presentViewController(alert, animated: true, completion: nil)
        }
    
    }
    
    
    @IBAction func upButton(sender: UIButton) {
        
        if addBehaviors == true {
        dynamicAnimator.addBehavior(dbBall)
        dynamicAnimator.addBehavior(cbBall)
        cb.addItem(playBall)
        cb2.addItem(playBall)
        }
        
        self.pushBehaviorUno = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehaviorUno.magnitude = 8
        pushBehaviorUno.angle = -3.14/2
        dynamicAnimator.addBehavior(pushBehaviorUno)
        print("start")
        
        winLogic()
        
        addBehaviors = false
        

    }
    
    @IBAction func upEnd(sender: UIButton) {
        
        dynamicAnimator.removeBehavior(pushBehaviorUno)
        dynamicAnimator.removeBehavior(dbBall)
        cb.removeItem(playBall)
        cb2.removeItem(playBall)

        addBehaviors = true
        
        winLogic()
    }
    
    @IBAction func leftButton(sender: UIButton) {
        
        if addBehaviors == true {
            dynamicAnimator.addBehavior(dbBall)
            dynamicAnimator.addBehavior(cbBall)
            cb.addItem(playBall)
            cb2.addItem(playBall)
        }
        
        self.pushBehaviorDos = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehaviorDos.magnitude = 8
        pushBehaviorDos.angle = 3.14
        dynamicAnimator.addBehavior(pushBehaviorDos)
        
        addBehaviors = false
    
        winLogic()
    }
    
    @IBAction func leftEnd(sender: UIButton) {
        
        dynamicAnimator.removeBehavior(pushBehaviorDos)
        dynamicAnimator.removeBehavior(dbBall)
        cb.removeItem(playBall)
        cb2.removeItem(playBall)
        
        addBehaviors = true
        
        winLogic()
    }
    
    @IBAction func downButton(sender: UIButton) {
        
        if addBehaviors == true {
            dynamicAnimator.addBehavior(dbBall)
            dynamicAnimator.addBehavior(cbBall)
            cb.addItem(playBall)
            cb2.addItem(playBall)
        }

        self.pushBehaviorTres = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehaviorTres.magnitude = 8
        pushBehaviorTres.angle = 3.14/2
        dynamicAnimator.addBehavior(pushBehaviorTres)
        
        addBehaviors = false
        
        winLogic()
    }
    
    @IBAction func downEnd(sender: UIButton) {
        
        dynamicAnimator.removeBehavior(pushBehaviorTres)
        dynamicAnimator.removeBehavior(dbBall)
        cb.removeItem(playBall)
        cb2.removeItem(playBall)
        
        addBehaviors = true
        
        winLogic()
    }

    @IBAction func rightButton(sender: UIButton) {
        
        if addBehaviors == true {
            dynamicAnimator.addBehavior(dbBall)
            dynamicAnimator.addBehavior(cbBall)
            cb.addItem(playBall)
            cb2.addItem(playBall)
        }

        self.pushBehaviorCuatro = UIPushBehavior(items: [playBall], mode: .Instantaneous)
        pushBehaviorCuatro.magnitude = 8
        pushBehaviorCuatro.angle = 0
        dynamicAnimator.addBehavior(pushBehaviorCuatro)
        
        addBehaviors = false
        
        winLogic()
        
    }
    
    @IBAction func rightEnd(sender: UIButton) {
        
        dynamicAnimator.removeBehavior(pushBehaviorCuatro)
        dynamicAnimator.removeBehavior(dbBall)
        cb.removeItem(playBall)
        cb2.removeItem(playBall)

        
        addBehaviors = true
        
        winLogic()
    }
    
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
        for block in blockArray {
            if item1.isEqual(playBall) && item2.isEqual(block) || item2.isEqual(playBall) && item1.isEqual(block){
            winArray.append(block)
            block.hidden = true
            cb2.removeItem(block)
            
            }
        }
        if winArray.count == 2 {
            allowWinning = true
        }
    }
    
      }
    


    

