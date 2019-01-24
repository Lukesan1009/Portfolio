//
//  World.swift
//  Collisions
//
//  Created by 90303107 on 1/7/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class World {
    
    func gravityOn(thing: SKSpriteNode) {
        thing.physicsBody?.affectedByGravity = true
    }
    
    func gravityOff(thing: SKSpriteNode) {
        thing.physicsBody?.affectedByGravity = false
    }
    
    func frame(environment: GameScene) {
        environment.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -(Dimensions().screenWidth() / 2), y: -(Dimensions().screenHeight() / 2), width: Dimensions().screenWidth(), height: Dimensions().screenHeight()))
        environment.physicsBody?.restitution = 0
        environment.physicsBody?.friction = 0
        environment.physicsBody?.linearDamping = 0
    }
    
    func impulse(thing: SKSpriteNode, level: Int) {
        //thing.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 120))
        
        let x = arc4random_uniform(4)
        
        if x == 0 {
            thing.physicsBody?.applyImpulse(CGVector(dx: 45 + 45 * level, dy: 54 + 54 * level))
        }
        else if x == 1 {
            thing.physicsBody?.applyImpulse(CGVector(dx: -45 - 45 * level, dy: 54 + 54 * level))
        }
        else if x == 2 {
            thing.physicsBody?.applyImpulse(CGVector(dx: 45 + 45 * level, dy: -54 - 54 * level))
        }
        else if x == 3 {
            thing.physicsBody?.applyImpulse(CGVector(dx: -45 - 45 * level, dy: -54 - 54 * level))
        }
    }
    
    func checkBackground(env: GameScene, blackBGCost: BlackBackgroundCost) {
        if env.blackBGPurchase == true && env.startBG != "black" {
            blackBGCost.getSprite().text = "Select"
        }
        if env.startBG == "black" {
            env.backgroundColor = UIColor.black
        }
    }
    
    func tutorial(env: GameScene, explain: Explanation, black: Background) {
        if env.firstTime == true {
            explain.add(env: env)
            black.add(env: env)
        }
    }
    
    func checkFirstTime(env: GameScene, black: Background, explain: Explanation) {
        if env.firstTime == true {
            black.getSprite().removeFromParent()
            explain.getSprite().removeFromParent()
            env.firstTime = false
            UserDefaults.standard.set(env.firstTime, forKey: "firstTime")
        }
    }
    
    func addBalls(env: GameScene, blue: Shape, quantum: World) {
        var addBallCounter = env.ballLevel
        
        while addBallCounter > 1 {
            let randX = Int(arc4random_uniform(120))
            let randY = Int(arc4random_uniform(300))
            let copiedNode = blue.getSprite().copy() as! SKSpriteNode
            copiedNode.position = CGPoint(x: randX, y: randY)
            env.addChild(copiedNode)
            quantum.impulse(thing: copiedNode, level: env.speedLevel)
            env.nodeArray.append(copiedNode)
            addBallCounter -= 1
        }
    }
    
    func getStored(env: GameScene, scoreLabel: Label, speedText: SpeedText, addBallCost: AddBallCost) {
        if let x = UserDefaults.standard.object(forKey: "score") as? Int {
            env.score = x
            scoreLabel.getSprite().text = String(env.score)
        }
        if let x = UserDefaults.standard.object(forKey: "speedLevel") as? Int {
            env.speedLevel = x
        }
        if let x = UserDefaults.standard.object(forKey: "speedCost") as? Int {
            env.speedCost = x
            speedText.getSprite().text = "Cost: \(env.speedCost)"
        }
        if let x = UserDefaults.standard.object(forKey: "ballCost") as? Int {
            env.ballCost = x
            addBallCost.getSprite().text = "Cost: \(env.ballCost)"
        }
        if let x = UserDefaults.standard.object(forKey: "ballLevel") as? Int {
            env.ballLevel = x
        }
        if let x = UserDefaults.standard.object(forKey: "color") as? String {
            env.color = x
        }
        if let x = UserDefaults.standard.object(forKey: "greenBought") as? Bool {
            env.greenBought = x
        }
        if let x = UserDefaults.standard.object(forKey: "whiteBought") as? Bool {
            env.whiteBought = x
        }
        
        if let x = UserDefaults.standard.object(forKey: "firstTime") as? Bool {
            env.firstTime = x
        }
        if let x = UserDefaults.standard.object(forKey: "background") as? String {
            env.startBG = x
        }
        if let x = UserDefaults.standard.object(forKey: "blackBGPurchase") as? Bool {
            env.blackBGPurchase = x
        }
    }
    
    func changeDirection(ballButton: BallButton, shopButton: ShopButton, close: Symbol, env: GameScene, fingerPosition: CGPoint) {
        if ballButton.getSprite().contains(fingerPosition) || shopButton.getSprite().contains(fingerPosition) {
            
        }
        else if env.checkBallShop == true {
            
        }
        else if close.getSprite().contains(fingerPosition) {
            
        }
        else {
            
            var arrayCount = env.nodeArray.count
            
            while arrayCount > 0 {
                
                let x = arc4random_uniform(3)
                
                if (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)! < CGFloat(0.0) && (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)! < CGFloat(0.0) {
                    if x == 0 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 1 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 2 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    
                }
                else if (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)! < CGFloat(0.0) && (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)! > CGFloat(0.0) {
                    if x == 0 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 1 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 2 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }                    }
                else if (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)! > CGFloat(0.0) && (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)! < CGFloat(0.0) {
                    if x == 0 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 1 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 2 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }                    }
                else if (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)! > CGFloat(0.0) && (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)! > CGFloat(0.0) {
                    if x == 0 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 1 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }
                    else if x == 2 {
                        env.nodeArray[arrayCount - 1].physicsBody?.velocity = CGVector(dx: (env.nodeArray[arrayCount - 1].physicsBody?.velocity.dx)!, dy: -(env.nodeArray[arrayCount - 1].physicsBody?.velocity.dy)!)
                    }                    }
                
                arrayCount -= 1
            }
        }
    }
}

class Background {
    private var black: SKShapeNode
    
    init() {
        black = SKShapeNode(rect: CGRect(x: -(Dimensions().screenWidth() / 2), y: -(Dimensions().screenHeight() / 2), width: Dimensions().screenWidth(), height: Dimensions().screenHeight()))
        black.fillColor = UIColor.black
        black.lineWidth = 0
        black.alpha = 0.2
        black.zPosition = 4
    }
    
    func add(env: GameScene) {
        env.addChild(black)
    }
    
    func getSprite() -> SKShapeNode {
        return self.black
    }
    
    func check(boolean1: Bool, env1: GameScene) {
        if boolean1 == false {
            env1.addChild(black)
            env1.boolean = true
        }
    }
}
