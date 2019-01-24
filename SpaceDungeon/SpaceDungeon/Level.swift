//
//  Level.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/24/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Level {
    
    private var Ledges : [Ledge]
    private var ledgeImage: String
    private var xPositions : [CGFloat]
    private var yPositions : [CGFloat]
    
    init (ledgeAmt: Int, Difficulty: Int, ledgeSprite: String){
        ledgeImage = ledgeSprite
        Ledges = [Ledge]()
        xPositions = [CGFloat]()
        yPositions = [CGFloat]()
        
        for number in (0 ... ledgeAmt){
            
            let one =  Int.random(in: 5 ... 5 + Difficulty)
            
            /////LEFT LEDGES///////////////////////////////////////////////////////////////////////
            if number % 2 == 0 {
                Ledges.append(Ledge(x: (Dimensions().screenWidth / 2) - 200 , y: CGFloat(1000 + 550 * number), img: ledgeSprite))
                Ledges[number].moveX(x: Int(Ledges[number].getXpos()))
                Ledges[number].moveY(y: Int(Ledges[number].getYpos()))
            }
            /////RIGHT LEDGES/////////////////////////////////////////////////////////////////////
            else {
                Ledges.append(Ledge(x: -(Dimensions().screenWidth / 2) + 200, y: CGFloat(1000 + 550 * number), img: ledgeSprite))
                Ledges[number].moveX(x: Int(Ledges[number].getXpos()))
                Ledges[number].moveY(y: Int(Ledges[number].getYpos()))
            }
            
            
            xPositions.append((Ledges[number].getXpos()))
            yPositions.append((Ledges[number].getYpos()))
            
            
        
        }
        
    }
    
    func addLevelLedges(env: GameScene){
        for item in Ledges {
            env.addChild(item.getSprite())
        }
        
    }
    func update(){
        for item in Ledges {
            var moveAction = SKAction.moveTo(y: CGFloat(item.getYpos() - 400), duration: TimeInterval(1))
            item.getSprite().run(moveAction)
            item.setYpos(y: item.getSprite().position.y)
            item.getSprite().zPosition = 3
           
        }
        
    }
    func optimize(){
        for item in Ledges {
            if item.getSprite().position.y < -700 {
                item.getSprite().removeFromParent()
            }
        }
    }
    func levelDone ()-> Bool {
        if Ledges[Ledges.count - 1].getSprite().position.y > -300 {
            return false
        }
        else {
            return true
           
        }
        
    }
   
    func clearLedges(){
        for item in Ledges {
            item.getSprite().removeFromParent()
        }
    }
}
