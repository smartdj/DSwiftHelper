//
//  UIViewControllerExtension.swift
//  BookReader
//
//  Created by Arthur on 2016/11/7.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = #selector(UIViewController.viewDidLoad)
            let swizzledSelector = #selector(UIViewController.fakeViewDidLoad)
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
    
    func fakeViewDidLoad(){
        self.fakeViewDidLoad()
        self.replaceGoBackButton()
    }
    
    func replaceGoBackButton(){
        if(self.navigationController != nil && self.navigationController?.viewControllers.count > 1){
            //方法一：
            let goBackButton:UIButton = UIButton()
            let normalImage = UIImage(named: "nav_back_white")
            let selectedImage = UIImage(named: "nav_back_white_selected")
            
            goBackButton.setImage(normalImage, forState: UIControlState.Normal)
            goBackButton.setImage(selectedImage, forState: UIControlState.Highlighted)
            goBackButton.frame = CGRectMake(0, 0, 85, 44)
            goBackButton.addTarget(self, action: #selector(goBackButtonTapped), forControlEvents: UIControlEvents.TouchUpInside)
            
            let goBackBarButtonItem = UIBarButtonItem.init(customView: goBackButton)
            self.navigationItem.leftBarButtonItem = goBackBarButtonItem
            self.navigationItem.hidesBackButton = true
            
            //方法二：
//            self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_white")
//            
//            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named:"nav_back_white")
//            
//            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        }
    }
    
    func goBackButtonTapped(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
}
