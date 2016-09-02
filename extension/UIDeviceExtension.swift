//
//  UIDeviceExtension.swift
//  BookReader
//
//  Created by Arthur on 16/9/2.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
            
//        case "iPhone1,1":  return "iPhone 2G";
//        case "iPhone1,2":  return "iPhone 3G";
//        case "iPhone2,1":  return "iPhone 3GS";
//        case "iPhone3,1":  return "iPhone 4";
//        case "iPhone3,2":  return "iPhone 4";
//        case "iPhone3,3":  return "iPhone 4 (CDMA)";
//        case "iPhone4,1":  return "iPhone 4S";
//        case "iPhone5,1":  return "iPhone 5";
//        case "iPhone5,2":  return "iPhone 5 (GSM+CDMA)";
//        case "iPhone5,3":  return "iPhone 5c (GSM+CDMA)";
//        case "iPhone5,4":  return "iPhone 5c (UK+Europe+Asia+China)";
//        case "iPhone6,1":  return "iPhone 5s (GSM+CDMA)";
//        case "iPhone6,2":  return "iPhone 5s (UK+Europe+Asia+China)";
//        
//        case "iPod1,1"  :  return "iPod Touch (1 Gen)";
//        case "iPod2,1"  :  return "iPod Touch (2 Gen)";
//        case "iPod3,1"  :  return "iPod Touch (3 Gen)";
//        case "iPod4,1"  :  return "iPod Touch (4 Gen)";
//        case "iPod5,1"  :  return "iPod Touch (5 Gen)";
//        
//        case "iPad1,1"  :  return "iPad";
//        case "iPad1,2"  :  return "iPad 3G";
//        case "iPad2,1"  :  return "iPad 2 (WiFi)";
//        case "iPad2,2"  :  return "iPad 2";
//        case "iPad2,3"  :  return "iPad 2 (CDMA)";
//        case "iPad2,4"  :  return "iPad 2";
//        case "iPad2,5"  :  return "iPad Mini (WiFi)";
//        case "iPad2,6"  :  return "iPad Mini";
//        case "iPad2,7"  :  return "iPad Mini (GSM+CDMA)";
//        case "iPad3,1"  :  return "iPad 3 (WiFi)";
//        case "iPad3,2"  :  return "iPad 3 (GSM+CDMA)";
//        case "iPad3,3"  :  return "iPad 3";
//        case "iPad3,4"  :  return "iPad 4 (WiFi)";
//        case "iPad3,5"  :  return "iPad 4";
//        case "iPad3,6"  :  return "iPad 4 (GSM+CDMA)";
//        case "iPad4,1"  :  return "iPad Air (WiFi)";
//        case "iPad4,2"  :  return "iPad Air (GSM+CDMA)";
//        case "iPad4,4"  :  return "iPad Mini Retina (WiFi)";
//        case "iPad4,5"  :  return "iPad Mini Retina (GSM+CDMA)";
//        
//        case "i386":         return "Simulator";
//        case "x86_64":       return "Simulator";
        default:                                        return identifier
        }
    }
    
}