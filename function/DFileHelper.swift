//
//  DFileHelper.swift
//  BookReader
//
//  Created by Arthur on 2016/11/1.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import UIKit

class DFileHelper: NSObject {
    static var documentDirectoryPath = {()->String in
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        return documentsPath
    }()
    
    
}
