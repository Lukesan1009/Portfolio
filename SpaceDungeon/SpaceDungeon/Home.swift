//
//  Home.swift
//  SpaceDungeon
//
//  Created by 90303107 on 12/17/2561 BE.
//  Copyright © 2561 BE 64911. All rights reserved.
//

import UIKit
import SpriteKit

func scaleHome(environment: Home) {
    environment.scaleMode = SKSceneScaleMode.resizeFill
}

class Button {
    private var sprite: SKLabelNode
    
    init(xPos : CGFloat, yPos: CGFloat) {
        sprite = SKLabelNode(text: "Touch to Start")
        sprite.fontSize = 30
        sprite.fontName = "Marker Felt Thin"
        sprite.position = CGPoint(x: xPos, y: yPos)
    }
    
    func add(env: Home) {
        env.addChild(sprite)
    }
    
    func getSprite() -> SKLabelNode {
        return sprite
    }
    
    func getWidth() -> CGFloat {
        return sprite.frame.width
    }
    
    func getHeight() -> CGFloat {
        return sprite.frame.height
    }
    
    func getXPos() -> CGFloat {
        return sprite.position.x
    }
    
    func getYPos() -> CGFloat {
        return sprite.position.y
    }
    
    func fades() {
        let fadeOut = SKAction.fadeOut(withDuration: (1))
        let fadeIn = SKAction.fadeIn(withDuration: (1))
        let sequence = SKAction.sequence([fadeOut, fadeIn])
        let repeatSeq = SKAction.repeatForever(sequence)
        getSprite().run(repeatSeq)
    }
}

class Home: SKScene {
    
    var start = Button(xPos: 0, yPos: -(Dimensions().screenHeight) / 2 + (Dimensions().screenHeight / 5))
    
    override func sceneDidLoad() {
        print(start.getWidth())
    }
    
    override func didMove(to view: SKView) {
        start.add(env: self)
        scaleHome(environment: self)
        start.fades()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let scene = GameScene(fileNamed: "GameScene") {
            let reveal = SKTransition.fade(withDuration: 0)
            view?.presentScene(scene, transition: reveal)
        }
    }
}
