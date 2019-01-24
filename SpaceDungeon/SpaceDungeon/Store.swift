//
//  Store.swift
//  SpaceDungeon
//
//  Created by 90303107 on 12/11/2561 BE.
//  Copyright © 2561 BE 64911. All rights reserved.
//

import UIKit

class Store {
    private var startPoint: CGPoint
    
    init(start: CGPoint){
        startPoint = start
    }
    func savePoint(point: CGPoint) {
        startPoint = point
    }
    
    func getPoint() -> CGPoint {
        return startPoint
    }
}
