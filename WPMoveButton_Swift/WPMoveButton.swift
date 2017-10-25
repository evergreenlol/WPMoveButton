//
//  WPMoveButton.swift
//  WPMoveButton_Swift
//
//  Created by wp on 2017/10/20.
//  Copyright © 2017年 wp. All rights reserved.
//

import UIKit

class WPMoveButton: UIButton {
    
    private var isMoved : Bool =  false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesMoved(touches, with: event)

        var touch = UITouch()
        touch = (touches as NSSet).anyObject()! as! UITouch
        //本次触摸点
        let current : CGPoint =  touch.location(in: self)
        //上次触摸点
        let previous : CGPoint = touch.previousLocation(in: self)
        var center :CGPoint = self.center

        //中心点移动触摸移动的距离
        center.x += current.x - previous.x;
        center.y += current.y - previous.y;

        let xMin : CGFloat = self.frame.size.width * 0.5
        let xMax : CGFloat = screen_width - xMin

        let yMin : CGFloat = self.frame.size.height * 0.5 + 64
        let yMax : CGFloat = screen_height - self.frame.size.height * 0.5

        if center.x > xMax {
            center.x = xMax
        }
        if center.x < xMin {
            center.x = xMin
        }
        if center.y > yMax {
            center.y = yMax
        }
        if center.y < yMin {
            center.y = yMin
        }
        self.center = center

        //移动距离大于0.5才判断为移动了(提高容错性)
        if (current.x - previous.x >= 0.5) || (current.y - previous.y >= 0.5) {
            isMoved = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isMoved {
            super.touchesEnded(touches, with: event)
        }
        isMoved =  false
    
        //回到屏幕边
//        let screenWidth = screen_width
//        let x : CGFloat = self.frame.size.width * 0.5
//
//        UIView .animate(withDuration: 0.25) {
//            var center : CGPoint = self.center
//            center.x = self.center.x > screenWidth * 0.5 ? screenWidth - x : x;
//            self.center = center
//        }
        self.isHighlighted = false
    }

}
