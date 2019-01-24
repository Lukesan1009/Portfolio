//
//  CornerClass.swift
//  Collisions
//
//  Created by 90303107 on 1/20/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class One {
    private var corner: SKSpriteNode
    
    init() {
        corner = SKSpriteNode(imageNamed: "white")
        corner.size.width = 45
        corner.size.height = 45
        corner.position = CGPoint(x: -(Dimensions().screenWidth() / 2), y: (Dimensions().screenHeight() / 2))
    }
    
    func add(env: GameScene) {
        env.addChild(corner)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.corner
    }
    
    func physicsBody() {
        corner.physicsBody = SKPhysicsBody(texture: corner.texture!, size: corner.size)
        corner.physicsBody?.isDynamic = false
    }
}

class Two {
    private var corner: SKSpriteNode
    
    init() {
        corner = SKSpriteNode(imageNamed: "white")
        corner.size.width = 45
        corner.size.height = 45
        corner.position = CGPoint(x: (Dimensions().screenWidth() / 2), y: (Dimensions().screenHeight() / 2))
    }
    
    func add(env: GameScene) {
        env.addChild(corner)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.corner
    }
    
    func physicsBody() {
        corner.physicsBody = SKPhysicsBody(texture: corner.texture!, size: corner.size)
        corner.physicsBody?.isDynamic = false
    }
}

class Three {
    private var corner: SKSpriteNode
    
    init() {
        corner = SKSpriteNode(imageNamed: "white")
        corner.size.width = 45
        corner.size.height = 45
        corner.position = CGPoint(x: -(Dimensions().screenWidth() / 2), y: -(Dimensions().screenHeight() / 2))
    }
    
    func add(env: GameScene) {
        env.addChild(corner)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.corner
    }
    
    func physicsBody() {
        corner.physicsBody = SKPhysicsBody(texture: corner.texture!, size: corner.size)
        corner.physicsBody?.isDynamic = false
    }
}

class Four {
    private var corner: SKSpriteNode
    
    init() {
        corner = SKSpriteNode(imageNamed: "white")
        corner.size.width = 45
        corner.size.height = 45
        corner.position = CGPoint(x: (Dimensions().screenWidth() / 2), y: -(Dimensions().screenHeight() / 2))
    }
    
    func add(env: GameScene) {
        env.addChild(corner)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.corner
    }
    
    func physicsBody() {
        corner.physicsBody = SKPhysicsBody(texture: corner.texture!, size: corner.size)
        corner.physicsBody?.isDynamic = false
    }
}
