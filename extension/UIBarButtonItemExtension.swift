//
//  UIBarButtonItemExtension.swift
//  BookReader
//
//  Created by Arthur on 2016/11/5.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation
import UIKit

public extension UIBarButtonItem{
    convenience init(imageName:String?, highlightedImageName:String?, title:String?, titleColor:UIColor?, fontSize:CGFloat?, size:CGSize?, target:AnyObject?, action:Selector?) {
        
        var button:UIButton? = nil
        
        if (title != nil){
            button = UIButton(type:UIButtonType.Custom)
            button?.setTitle(title, forState: UIControlState.Normal)
            button?.setTitle(title, forState: UIControlState.Selected)
            
            if(fontSize != nil && button != nil){
                button?.titleLabel?.font = UIFont.systemFontOfSize(fontSize!)
            }
            
            if(titleColor != nil && button != nil){
                button?.setTitleColor(titleColor, forState:UIControlState.Normal)
            }
        }
        else{
            button = UIButton(type:UIButtonType.DetailDisclosure)
        }
        
        if(size != nil && button != nil){
            button?.frame = CGRectMake(0, 0, size!.width, size!.height);
        }
        
        if(target != nil && action != nil && button != nil){
            button?.addTarget(target, action: action!, forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        if(imageName != nil && button != nil){
            let image = UIImage(named:imageName!)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            button!.setImage(image, forState:UIControlState.Normal)
        }
        
        if(highlightedImageName != nil && button != nil){
            let image = UIImage(named:highlightedImageName!)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            button!.setImage(image, forState:UIControlState.Highlighted)
        }
        
        self.init(customView:button!);
    }
}
