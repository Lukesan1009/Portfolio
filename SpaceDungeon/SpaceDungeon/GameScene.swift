//
//  GameScene.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/20/18.
//  Copyright © 2018 64911. All rights reserved.
//

import SpriteKit
import GameplayKit

func scale(environment: GameScene) {
    environment.scaleMode = SKSceneScaleMode.resizeFill
}

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var Obama = Player(img: "obungo")
    var dungeonGame = Game()
    var levelDone = false
    var timer = 0
    var savedPoint = Store(start: CGPoint(x: 0, y: 0))
    var either = Dimensions()
    
    
    override func sceneDidLoad() {
        
        dungeonGame.addToBackground(env: self)
        dungeonGame.nextLevel(enviornment: self)
        Obama.addToEnvironment(env: self)
        print("\(either.screenWidth), \(either.screenHeight)")
        
    }
    override func didMove(to view: SKView) {
        scale(environment: self)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
     
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            savedPoint.savePoint(point: position)

        }
       
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let fingerRelease = touch.location(in: self)
            
            Obama.run(Obama: Obama, fingerRelease: fingerRelease, savedPoint: savedPoint, either: either)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        timer = timer + 1
        dungeonGame.dynamicLevelBackground()
        dungeonGame.updateCurrentLevel()
        dungeonGame.optimizeLevelBackground()
        if (timer % 5 == 0){
            dungeonGame.animateBackground()
        }
        if (dungeonGame.levelDone()) {
            dungeonGame.removeStaticObject()
            
            dungeonGame.nextLevel(enviornment: self)
            levelDone = false
        }

    }
         
}
