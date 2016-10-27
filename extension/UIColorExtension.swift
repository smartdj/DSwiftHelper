//
//  UIColorExtension.swift
//  BookReader
//
//  Created by Arthur on 2016/10/26.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor{
    class func colorFromRBG(hex:Int) -> UIColor
    {
        return colorFromRBG(hex, alpha: 1.0);
    }
    
    class func colorFromRBG(hex:Int, alpha:CGFloat) -> UIColor
    {
        return UIColor.init(red: ((CGFloat)((hex & 0xFF0000) >> 16))/255.0,
                            green: ((CGFloat)((hex & 0x00FF00) >>  8))/255.0,
                            blue: ((CGFloat)((hex & 0x0000FF) >>  0))/255.0,
                            alpha: alpha)
    }
}
