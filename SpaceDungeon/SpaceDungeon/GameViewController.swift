//
//  GameViewController.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/20/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
//        if let view = self.view as! SKView? {
//            if let scene = SKScene(fileNamed: "Home") {
//                scene.scaleMode = .aspectFill
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
//
//            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
        
        if let scene = GKScene(fileNamed: "Home") {
            if let sceneNode = scene.rootNode as! Home? {
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.preferredFramesPerSecond = 60
                    view.ignoresSiblingOrder = true
                    view.showsNodeCount = true
                }
            }
        }
    }
}
