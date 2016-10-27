//
//  UIView.swift
//  BookReader
//
//  Created by Arthur on 2016/10/26.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public enum BorderDirect:Int
{
    case topBorder = 0
    case leftBorder = 1
    case bottomBorder = 2
    case rightBorder = 3
};

public extension UIView{
  
    func setBorder(direct:BorderDirect, color:UIColor, widthOrHeight:CGFloat, edgeInsets:UIEdgeInsets){
        
        let view:UIView = UIView();
        view.tag = direct.rawValue;
        view.backgroundColor = color;
        self.addSubview(view);
        
        if (direct == .topBorder) {
            view.snp_makeConstraints{[weak self](make) -> Void in
                make.left.equalTo(0).offset(edgeInsets.left);
                make.top.equalTo(0).offset(edgeInsets.top);
                make.right.equalTo(self!).offset(edgeInsets.right);
                make.height.equalTo(widthOrHeight);
            }
        }
        else if( direct == .leftBorder){
            view.snp_makeConstraints{[weak self](make) -> Void in
                make.left.equalTo(0);
                make.top.equalTo(edgeInsets.top);
                make.width.equalTo(widthOrHeight);
                make.bottom.equalTo(self!).offset(edgeInsets.bottom);
            }
        }
        else if( direct == .bottomBorder){
            view.snp_makeConstraints{[weak self](make) -> Void in
                make.left.equalTo(edgeInsets.left);
                make.top.equalTo(self!.frame.height - widthOrHeight * 2);
                make.width.equalTo(widthOrHeight);
                make.bottom.equalTo(self!).offset(edgeInsets.bottom);
            }
        }
        else if( direct == .rightBorder){
            view.snp_makeConstraints{[weak self](make) -> Void in
                make.left.equalTo(self!.frame.width - widthOrHeight);
                make.top.equalTo(edgeInsets.top);
                make.width.equalTo(widthOrHeight);
                make.bottom.equalTo(self!).offset(edgeInsets.bottom);
            }
        }
    }
}
