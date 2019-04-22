//
//  XYZColor.swift
//  XYZColor
//
//  Created by 张子豪 on 2018/8/25.
//  Copyright © 2018年 zhangqian. All rights reserved.
//

import UIKit


public class XYZColor: NSObject {
    public var  XColor = UIColor()
    public func ColorX(_ red:CGFloat,_ green:CGFloat,_ blue:CGFloat,_ alpha:CGFloat = 1.0) -> UIColor {
        return UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    init(_ red:CGFloat,_ green:CGFloat,_ blue:CGFloat,_ alpha:CGFloat = 1.0) {
        self.XColor = UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
   
}


public extension UIColor{
       class var Succeeded: UIColor {
        return UIColor(red: 73/255, green: 210/255, blue: 67/255, alpha:0.5)
    }
       class var Failed: UIColor {
        return UIColor(red: 238/255, green: 48/255, blue: 7/255, alpha:0.5)
    }
       class var Converting: UIColor {
        return UIColor(red: 126/255, green: 219/255, blue: 212/255, alpha:0.5)
    }
       class var WeiBo: UIColor {
        return UIColor(red: 247/255, green: 148/255, blue: 34/255, alpha:0.8)
    }
       class var WeChat: UIColor {
        return UIColor(red: 13/255, green: 190/255, blue: 38/255, alpha:0.8)
    }
       class var GIFOut: UIColor {
        return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha:0.8)
    }
       class var GIFSize: UIColor {
        return UIColor(red: 247/255, green: 200/255, blue: 96/255, alpha:0.8)
    }
}
public extension UIColor{
     struct xyzcolor {
        struct Netflix {
            public static let light = UIColor(rgb: 0x485563)
            public static let dark = UIColor(rgb: 0x29323c)
        }
    }
}

public class SelfColor_Extension: NSObject {
    
    public var TLPhotoPickerselectedColor = UIColor(red: 88/255, green: 144/255, blue: 255/255, alpha: 1.0)
    public var ux = UIColor.clear
}



public extension UIColor {
       static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
       static let darkDefault = UIColor(white: 45.0/255.0, alpha: 1)
       static let grayText = UIColor(white: 160.0/255.0, alpha: 1)
       static let facebookDarkBlue = UIColor.by(r: 59, g: 89, b: 152)
       static let dimmedLightBackground = UIColor(white: 100.0/255.0, alpha: 0.3)
       static let dimmedDarkBackground = UIColor(white: 50.0/255.0, alpha: 0.3)
       static let pinky = UIColor(rgb: 0xE91E63)
       static let amber = UIColor(rgb: 0xFFC107)
       static let satCyan = UIColor(rgb: 0x00BCD4)
       static let darkText = UIColor(rgb: 0x212121)
       static let redish = UIColor(rgb: 0xFF5252)
       static let darkSubText = UIColor(rgb: 0x757575)
       static let greenGrass = UIColor(rgb: 0x4CAF50)
       static let darkChatMessage = UIColor(red: 48, green: 47, blue: 48)
}

public struct EKColor {
    public struct BlueGray {
        public static let c50 = UIColor(rgb: 0xeceff1)
        public static let c100 = UIColor(rgb: 0xcfd8dc)
        public static let c200 = UIColor(rgb: 0xb0bec5)
        public static let c300 = UIColor(rgb: 0x90a4ae)
        public static let c400 = UIColor(rgb: 0x78909c)
        public static let c500 = UIColor(rgb: 0x607d8b)
        public static let c600 = UIColor(rgb: 0x546e7a)
        public static let c700 = UIColor(rgb: 0x455a64)
        public static let c800 = UIColor(rgb: 0x37474f)
        public static let c900 = UIColor(rgb: 0x263238)
    }
    
    public struct Netflix {
        public static let light = UIColor(rgb: 0x485563)
        public static let dark = UIColor(rgb: 0x29323c)
    }
    
    public struct Gray {
        public static let a800 = UIColor(rgb: 0x424242)
        public static let mid = UIColor(rgb: 0x616161)
        public static let light = UIColor(white: 230.0/255.0, alpha: 1)
    }
    
    public struct Purple {
        public static let a300 = UIColor(rgb: 0xba68c8)
        public static let a400 = UIColor(rgb: 0xab47bc)
        public static let a700 = UIColor(rgb: 0xaa00ff)
        public static let deep = UIColor(rgb: 0x673ab7)
    }
    
    public struct BlueGradient {
        public static let light = UIColor(red: 100, green: 172, blue: 196)
        public static let dark = UIColor(red: 27, green: 47, blue: 144)
    }
    
    public struct Yellow {
        public static let a700 = UIColor(rgb: 0xffd600)
    }
    
    public struct Teal {
        public static let a700 = UIColor(rgb: 0x00bfa5)
        public static let a600 = UIColor(rgb: 0x00897b)
    }
    
    public struct Orange {
        public static let a50 = UIColor(rgb: 0xfff3e0)
    }
    
    public struct LightBlue {
        public static let a700 = UIColor(rgb: 0x0091ea)
    }
    
    public struct LightPink {
        public static let first = UIColor(rgb: 0xff9a9e)
        public static let last = UIColor(rgb: 0xfad0c4)
    }
}
