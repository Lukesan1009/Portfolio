//
//  Background.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/5/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Background{
    
    var backgrounds = [BackgroundTile]()
    var staticObjects = [StaticBackgroundObject]()
    
    init(numofScreens: Int, imgs: [String]){
        for number in 1 ... numofScreens {
                let bgOne = BackgroundTile(images: imgs, speed: 5)
                backgrounds.append(bgOne)
        }
    }
    init(numofScreens: Int, imgs: [String], staticbgimg: String){
        for number in 1 ... numofScreens {
            let bgOne = BackgroundTile(images: imgs, speed: 5)
            backgrounds.append(bgOne)
           
        }
        let levelOneStatues = StaticBackgroundObject(img: staticbgimg , x: 0, y: 150 , z: 2)
        staticObjects.append(levelOneStatues)
    }
    
    func addBackground(env: GameScene){
        
        var counter = 0
        for item in backgrounds {
            if counter == 0 {
                var zcounter = -1
                for tile in item.getSprites(){
                    env.addChild(tile)
                    tile.position.x = 0
                    tile.position.y = CGFloat(0)
                    item.setYpos(y: 810)
                    tile.zPosition = CGFloat(zcounter)
                    zcounter = zcounter - 1
                }
            }
            else {
                var zcounter = -1
                for tile in item.getSprites(){
                    env.addChild(tile)
                    tile.position.x = 0
                    tile.position.y = CGFloat(backgrounds[counter - 1].getYpos() + Int(Dimensions().screenHeight))
                    item.setYpos(y: backgrounds[counter - 1].getYpos() + Int(Dimensions().screenHeight))
                    tile.zPosition = CGFloat(zcounter)
                    zcounter = zcounter - 1
                }
           
            }
            
            counter = counter + 1
        }
        for item in staticObjects {
            env.addChild(item.objectImage)
            item.objectImage.position.x = CGFloat(item.xPos)
            item.objectImage.position.y = CGFloat(item.yPos)
            item.objectImage.zPosition = CGFloat(item.zPos)
        }
        
    }
    func addImage(count: Int, image: [String], enviornment: GameScene) {
        for number in 0...count{
            let newImg = BackgroundTile(images: image, speed: 5)
            backgrounds.append(newImg)
            for item in backgrounds{
                for tile in item.getSprites(){
                    tile.removeFromParent()
                }
            }
            for item in staticObjects{
                item.objectImage.removeFromParent()
            }
            addBackground(env: enviornment)
        }
    }
    
    func dynamicBackground(){
        for item in backgrounds {
            for tile in item.getSprites() {
                let moveAction = SKAction.moveTo(y: CGFloat(tile.position.y - 400), duration: TimeInterval(1))
                tile.run(moveAction)
                tile.position.y = tile.position.y
                item.setYpos(y: Int(tile.position.y))
                
            }
        }
        
    }
    
    func addStaticImage(img: String, x: Int, y: Int, enviornment: GameScene, removeothers: Bool){
    
    
                let obj = StaticBackgroundObject(img: img, x: x, y: y, z: 2)
                if removeothers {
                removeStaticObjects()
                }
                staticObjects.append(obj)
                for item in backgrounds{
                    for tile in item.getSprites(){
                    tile.removeFromParent()
                    }
                }
                for item in staticObjects{
                    item.objectImage.removeFromParent()
                }
                addBackground(env: enviornment)
            
        
    }
    func removeStaticObjects(){
        for item in staticObjects {
            item.objectImage.removeFromParent()
        }
    }
    
    func optimizeBackground(){
        
        for item in backgrounds {
            if item.getYpos() < Int(-(Dimensions().screenHeight) - (Dimensions().screenHeight / 2)){
                for tile in item.getSprites() {
                tile.removeFromParent()
                }
            }
            
        }
    }
    func animateBackground(){
        
        for item in backgrounds{
            var counter = 0
            var saveZpos = 0
            for tile in item.getSprites(){
                if counter == 0 {
                    saveZpos = Int(tile.zPosition)
                    tile.zPosition = item.getSprites()[counter + 1].zPosition
                    //print(item.getSprites()[counter + 1].zPosition)
                }
                else if counter == item.getSprites().count - 1 {
                    tile.zPosition = CGFloat(saveZpos)
                    //print(CGFloat(saveZpos))
                }
                else {
                    tile.zPosition = item.getSprites()[counter + 1].zPosition
                    //print(item.getSprites()[counter + 1].zPosition)
                }
                
                counter = counter + 1
            }
        }
    }
    
    
}
