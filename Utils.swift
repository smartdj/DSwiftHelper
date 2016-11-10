//
//  Utils.swift
//  BookReader
//
//  Created by Arthur on 2016/11/8.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation

//必须使用可执行文件的名字获取类名
func getClass(className:String) -> AnyClass?{
    if  let executableName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleExecutable") as! String? {
        // generate the full name of your class (take a look into your "YourProject-swift.h" file)
        //let classStringName = appName! + "." + className
        let classStringName = executableName! + "." + className
        // return the class!
        return NSClassFromString(classStringName)
    }
    return nil;
}
