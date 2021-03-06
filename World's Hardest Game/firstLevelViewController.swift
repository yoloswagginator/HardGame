//  Lukas Wilke, Logan Shuck, Timmy Somary
//
//  firstLevelViewController.swift
//  World's Hardest Game
//
//  Created by student3 on 4/29/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class firstLevelViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var dedsLabel: UILabel!
    @IBOutlet weak var startPlatform: UIImageView!
    @IBOutlet weak var mainPlatform: UIImageView!
    @IBOutlet weak var endPlatform: UIImageView!
    @IBOutlet weak var blueBlock1: UIView!
    @IBOutlet weak var blueBlock2: UIView!
    @IBOutlet weak var blueBlock3: UIView!
    @IBOutlet weak var blueBlock4: UIView!
    @IBOutlet weak var blueBlock5: UIView!
    @IBOutlet weak var yellowBlock1: UIView!
    @IBOutlet weak var yellowBlock2: UIView!

    var pepperoni = 0
    var playBall = UIView()
    var collision = false
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
    var blueBlockArray = [UIView]()
    var winArray = [UIView]()
    var allowWinning = false
    var nextPageLabel = false
    var boundaryOne = UIView(frame: CGRect(x: 16, y: 296, width: 113, height: 6))
    var boundaryTwo = UIView(frame: CGRect(x: 16, y: 296, width: 6, height: 176))
    var boundaryThree = UIView(frame: CGRect(x: 16, y: 466, width: 113, height: 6))
    var boundaryFour = UIView(frame: CGRect(x: 121, y: 216, width: 8, height: 81))
    var boundaryFive = UIView(frame: CGRect(x: 121, y: 466, width: 8, height: 81))
    var boundarySix = UIView(frame: CGRect(x: 121, y: 216, width: 782, height: 8))
    var boundarySeven = UIView(frame: CGRect(x: 895, y: 216, width: 8, height: 81))
    var boundaryEight = UIView(frame: CGRect(x: 121, y: 546, width: 782, height: 6))
    var boundaryNine = UIView(frame: CGRect(x: 895, y: 466, width: 8, height: 81))
    var boundaryTen = UIView(frame: CGRect(x: 895, y: 296, width: 113, height: 6))
    var boundaryEleven = UIView(frame: CGRect(x: 1002, y: 296, width: 6, height: 176))
    var boundaryTwelve = UIView(frame: CGRect(x: 895, y: 466, width: 113, height: 6))

    
    
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
        blueBlockArray.append(blueBlock1)
        blueBlockArray.append(blueBlock2)
        blueBlockArray.append(blueBlock3)
        blueBlockArray.append(blueBlock4)
        blueBlockArray.append(blueBlock5)
    }

    override func viewWillAppear(animated: Bool) {
        makeBall()
        dynamicActions()
        winArray.removeAll()
        allowWinning = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        dynamicAnimator.removeAllBehaviors()
        view.willRemoveSubview(playBall)
        for block in blueBlockArray {
            view.willRemoveSubview(block)
        }
        for block in blockArray {
            view.willRemoveSubview(block)
        }
        for boundary in boundaryArray {
            view.willRemoveSubview(boundary)
        }
    }


    func dynamicActions() {
        let dynamicItemBehavior = UIDynamicItemBehavior(items: [blueBlock1, blueBlock2, blueBlock3, blueBlock4, blueBlock5])
        dynamicItemBehavior.density = 10.0
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
        dynamicItemBehaviorThree.density = 1000
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
    
    func makeBall() {
        playBall.frame = CGRect(x: 62, y: 372, width: 25, height: 25)
        playBall.backgroundColor = UIColor.greenColor()
        view.addSubview(playBall)
        blueBlock1.frame = CGRect(x: 242, y: 369, width: 30, height: 30)
        blueBlock2.frame = CGRect(x: 372, y: 369, width: 30, height: 30)
        blueBlock3.frame = CGRect(x: 497, y: 369, width: 30, height: 30)
        blueBlock4.frame = CGRect(x: 626, y: 369, width: 30, height: 30)
        blueBlock5.frame = CGRect(x: 753, y: 369, width: 30, height: 30)
        yellowBlock1.frame = CGRect(x: 505, y: 243, width: 15, height: 15)
        yellowBlock2.frame = CGRect(x: 505, y: 508, width: 15, height: 15)
        for block in blueBlockArray {
            block.backgroundColor = UIColor.blueColor()
            view.addSubview(block)
        }
        for block in blockArray {
            block.hidden = false
            block.backgroundColor = UIColor.redColor()
            view.addSubview(block)
        }
        boundaryOne = UIView(frame: CGRect(x: 16, y: 296, width: 113, height: 6))
        boundaryTwo = UIView(frame: CGRect(x: 16, y: 296, width: 6, height: 176))
        boundaryThree = UIView(frame: CGRect(x: 16, y: 466, width: 113, height: 6))
        boundaryFour = UIView(frame: CGRect(x: 121, y: 216, width: 8, height: 81))
        boundaryFive = UIView(frame: CGRect(x: 121, y: 466, width: 8, height: 81))
        boundarySix = UIView(frame: CGRect(x: 121, y: 216, width: 782, height: 8))
        boundarySeven = UIView(frame: CGRect(x: 895, y: 216, width: 8, height: 81))
        boundaryEight = UIView(frame: CGRect(x: 121, y: 546, width: 782, height: 6))
        boundaryNine = UIView(frame: CGRect(x: 895, y: 466, width: 8, height: 81))
        boundaryTen = UIView(frame: CGRect(x: 895, y: 296, width: 113, height: 6))
        boundaryEleven = UIView(frame: CGRect(x: 1002, y: 296, width: 6, height: 176))
        boundaryTwelve = UIView(frame: CGRect(x: 895, y: 466, width: 113, height: 6))
        
        for boundary in boundaryArray {
            view.addSubview(boundary)
        }

        
        
    }

    @IBAction func pause(sender: UIButton) {
        dynamicAnimator.removeAllBehaviors()
        
        let alert = UIAlertController(title: "Paused", message: "press OK to resume", preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "OK", style: .Default) { (alert) in
            self.dynamicActions()
        }
        alert.addAction(ok)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    func addCollisionBehaviors() {
        dynamicAnimator.addBehavior(dbBall)
        dynamicAnimator.addBehavior(cbBall)
        cb.addItem(playBall)
        cb2.addItem(playBall)
    }
    
    func winLogic() {
        if CGRectContainsRect(endPlatform.frame, playBall.frame) == true && allowWinning == true{
            performSegueWithIdentifier("loserSegue", sender: nil)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! loserViewController
        if CGRectContainsRect(endPlatform.frame, playBall.frame) == true && allowWinning == true{
            next.labelText = true
        }
        else  {
            next.labelText = false
        }
        next.sausage = pepperoni
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
        
        winLogic()
        
        addBehaviors = false
        

    }
    
    @IBAction func upEnd(sender: UIButton) {
        
        dynamicAnimator.removeBehavior(pushBehaviorUno)
        dynamicAnimator.removeBehavior(dbBall)
        cb.removeItem(playBall)
        cb2.removeItem(playBall)

        addBehaviors = true
        
        addCollisionBehaviors()
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
        
        addCollisionBehaviors()
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
        
        addCollisionBehaviors()
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
        
        addCollisionBehaviors()
        winLogic()
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        
     
        if item1.isEqual(blueBlock1) && item2.isEqual(playBall) || item1.isEqual(playBall) && item2.isEqual(blueBlock1) {
            performSegueWithIdentifier("loserSegue", sender: nil)
            addPepperoniToHardGamePizza()
        }
        
        if item1.isEqual(blueBlock2) && item2.isEqual(playBall) || item1.isEqual(playBall) && item2.isEqual(blueBlock2) {
            performSegueWithIdentifier("loserSegue", sender: nil)
            addPepperoniToHardGamePizza()
        }

        if item1.isEqual(blueBlock3) && item2.isEqual(playBall) || item1.isEqual(playBall) && item2.isEqual(blueBlock3) {
            performSegueWithIdentifier("loserSegue", sender: nil)
            addPepperoniToHardGamePizza()
        }

        if item1.isEqual(blueBlock4) && item2.isEqual(playBall) || item1.isEqual(playBall) && item2.isEqual(blueBlock4) {
            performSegueWithIdentifier("loserSegue", sender: nil)
            addPepperoniToHardGamePizza()
        }
        
        if item1.isEqual(blueBlock5) && item2.isEqual(playBall) || item1.isEqual(playBall) && item2.isEqual(blueBlock5) {
            performSegueWithIdentifier("loserSegue", sender: nil)
            addPepperoniToHardGamePizza()
        }


        
    
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
    
    func addPepperoniToHardGamePizza() {
        pepperoni = pepperoni + 1
        dedsLabel.text = "Deaths: \(pepperoni)"
    }
    
    
    @IBAction func backButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}





