//
//  Ledge.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/20/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit

class Ledge {
    
    /////////////////////////
    
    var xPos : CGFloat
    var sprite : SKSpriteNode
    var yPos : CGFloat
    
    ////////////////////////
    
    init(x: CGFloat, y: CGFloat, img: String){
        sprite = SKSpriteNode(imageNamed: img)
        self.xPos = x
        self.yPos = y
        sprite.position.x = xPos
        sprite.position.y = yPos
    }
    
    ////////////////////////
    //GETTERS//////////////
    
    func getSprite() -> SKSpriteNode {
        return self.sprite
    }
    
    func getYpos() -> CGFloat {
        return self.yPos
    }
    
   
    
    func getXpos() -> CGFloat {
        return self.xPos
    }
    
 
    /////////////////////////
    //SETTERS////////////////
    
    func setYpos(y: CGFloat){
        self.yPos = y
    }
    
    func setXpos(x: CGFloat){
        self.xPos = x
    }
    
    ////////////////////////
    //UTILITY//////////////
    
    func moveX(x: Int){
        self.sprite.position.x = CGFloat(x)
    }
    
    func moveY(y: Int){
        self.sprite.position.y = CGFloat(y)
    }
}
