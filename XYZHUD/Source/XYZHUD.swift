////
////  XYZHUD.swift
////  VTLMaker
////
////  Created by 张子豪 on 2019/2/10.
////  Copyright © 2019 张子豪. All rights reserved.
////
//
import UIKit
import Localize_Swift
////import XYZColor
import MBProgressHUD
//
//
public var XYZHUD = XYZHUDObject()
public class XYZHUDObject: NSObject {
    //延迟调用
    public func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
        let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

    
//
    public var popedView = CustomPopupViewController()
//    
//    
    public var MBpopedView = MBProgressHUD()
//    //新加适配的
    @discardableResult
    public func 弹出popUPView(延迟时间:Double = 0.5,标题:String = "成功",描述:String = "成功了",颜色:UIColor = UIColor(red: 73/255, green: 210/255, blue: 67/255, alpha:0.5)) -> CustomPopupViewController {
        let rootViewController = CustomPopupViewController()
        rootViewController.isTop = true
        rootViewController.titleString = 标题
        rootViewController.descriptionString = 描述
        rootViewController.CustomPopupViewbackgroundColor = 颜色
        afterDelay(延迟时间) {
            DispatchQueue.main.async {
                PopupWindowManager.shared.changeKeyWindow(rootViewController: rootViewController)
            }
        }
        return rootViewController
    }
  
    @discardableResult
    public func 弹出popUPView(标题:String = "成功",描述:String = "成功了",颜色:UIColor = UIColor(red: 73/255, green: 210/255, blue: 67/255, alpha:0.5)) -> CustomPopupViewController {
        dismiss()
        let rootViewController = CustomPopupViewController()
        rootViewController.显示时长 = 100
        rootViewController.isTop = true
        rootViewController.titleString = 标题
        rootViewController.descriptionString = 描述
        rootViewController.CustomPopupViewbackgroundColor = 颜色
        DispatchQueue.main.async {
            PopupWindowManager.shared.changeKeyWindow(rootViewController: rootViewController)
        }
        popedView = rootViewController
        return rootViewController
    }
    
    public func dismiss() {
        popedView.dismiss(animated: true, completion: nil)
    }
    public func GIFTranfering()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在将GIF转换为Video".localized(), 颜色: UIColor.Converting)
    }
    
    public func Succeed()  {

        弹出popUPView(标题: "成功了".localized(), 描述: "已经转换成功".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func Waiting()  {
    
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换".localized(), 颜色: UIColor.Converting)
    }
    
    public func Failed()  {
        print("出错了")

          弹出popUPView(标题: "请稍等".localized(), 描述: "出错了".localized(), 颜色: UIColor.Failed)
    }
    
    
    
    public func pop正在转换成LMR请稍等()  {
          弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换成LMR，保存在本软件中".localized(), 颜色: UIColor.Converting)
    }
    
    public func pop用于分享请稍等()  {
           弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备数据用于分享".localized(), 颜色: UIColor.Converting)
    }
    public func pop您没有选照片()  {
           弹出popUPView(标题: "您没有选照片".localized(), 描述: "重新选".localized(), 颜色: UIColor.Failed)
    }
    
    public func pop成功了()  {
          弹出popUPView(标题: "成功了".localized(), 描述: "去相册看看吧☺".localized(), 颜色: UIColor.Succeeded)
        
    }
    
    public func pop失败了权限的原因无法保存()  {
          弹出popUPView(标题: "失败了".localized(), 描述: "很有可能因为权限的原因无法保存".localized(), 颜色: UIColor.Failed)
    }
    
    public func pop请稍等正在转换()  {
          弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换".localized(), 颜色: UIColor.Converting)
        
    }
    
    
    public func 请稍等正在还原()  {
        弹出popUPView(标题: "稍等正在还原".localized(), 描述: "马上就好".localized(), 颜色: UIColor.GIFSize)
    }
    public func 打开失败(描述: String) {
        弹出popUPView(标题: "打开失败".localized(), 描述: 描述, 颜色: UIColor.Failed)
    }
    
    
    public func 反馈成功View() {
        弹出popUPView(标题: "反馈成功".localized(), 描述: "我会尽快回复您的邮件，您的反馈对软件的改进很重要".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func 正在准备视频用于分享() {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备视频用于分享".localized(), 颜色: UIColor.Converting)
    }
    
    
    public func 去相册看看转换好的视频吧()  {
        弹出popUPView(标题: "成功了".localized(), 描述: "去相册看看转换好的视频吧☺".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func 准备GIF数据用于分享()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备GIF数据用于分享".localized(), 颜色: UIColor.Converting)
    }
    
    public func GIF成功()  {
        弹出popUPView(标题: "成功了".localized(), 描述: "您可以通过⚙自定义GIF表情的速度、帧数、大小".localized(), 颜色: UIColor.Succeeded)
    }
    
    
    public func 视频大小决定处理时间长度()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换,视频大小决定处理时间长度".localized(), 颜色: UIColor.Converting)
    }
    
    public func 正在转换成LMR用于分享()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换成LMR用于分享".localized(), 颜色: UIColor.Converting)
    }
    
    
}
// 
//
//
//private class XYZColor: NSObject {
//    public var  XColor = UIColor()
//    public func ColorX(_ red:CGFloat,_ green:CGFloat,_ blue:CGFloat,_ alpha:CGFloat = 1.0) -> UIColor {
//        return UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
//    }
//    init(_ red:CGFloat,_ green:CGFloat,_ blue:CGFloat,_ alpha:CGFloat = 1.0) {
//        self.XColor = UIColor(red:red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
//    }
//    
//}
//
//
private extension UIColor{
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
//private extension UIColor{
//    struct xyzcolor {
//        struct Netflix {
//            public static let light = UIColor(rgb: 0x485563)
//            public static let dark = UIColor(rgb: 0x29323c)
//        }
//    }
//}
//
//private class SelfColor_Extension: NSObject {
//    
//    public var TLPhotoPickerselectedColor = UIColor(red: 88/255, green: 144/255, blue: 255/255, alpha: 1.0)
//    public var ux = UIColor.clear
//}
//
//
//
private extension UIColor {
//    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
//        let d = CGFloat(255)
//        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
//    }
//
//    convenience init(red: Int, green: Int, blue: Int) {
//        assert(red >= 0 && red <= 255, "Invalid red component")
//        assert(green >= 0 && green <= 255, "Invalid green component")
//        assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
//
//    convenience init(rgb: Int) {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF
//        )
//    }
//    
    static let darkDefault = UIColor(white: 45.0/255.0, alpha: 1)
    static let grayText = UIColor(white: 160.0/255.0, alpha: 1)
//    static let facebookDarkBlue = UIColor.by(r: 59, g: 89, b: 152)
//    static let dimmedLightBackground = UIColor(white: 100.0/255.0, alpha: 0.3)
//    static let dimmedDarkBackground = UIColor(white: 50.0/255.0, alpha: 0.3)
//    static let pinky = UIColor(rgb: 0xE91E63)
//    static let amber = UIColor(rgb: 0xFFC107)
//    static let satCyan = UIColor(rgb: 0x00BCD4)
//    static let darkText = UIColor(rgb: 0x212121)
//    static let redish = UIColor(rgb: 0xFF5252)
//    static let darkSubText = UIColor(rgb: 0x757575)
//    static let greenGrass = UIColor(rgb: 0x4CAF50)
//    static let darkChatMessage = UIColor(red: 48, green: 47, blue: 48)
}

//private struct EKColor {
//    public struct BlueGray {
//        public static let c50 = UIColor(rgb: 0xeceff1)
//        public static let c100 = UIColor(rgb: 0xcfd8dc)
//        public static let c200 = UIColor(rgb: 0xb0bec5)
//        public static let c300 = UIColor(rgb: 0x90a4ae)
//        public static let c400 = UIColor(rgb: 0x78909c)
//        public static let c500 = UIColor(rgb: 0x607d8b)
//        public static let c600 = UIColor(rgb: 0x546e7a)
//        public static let c700 = UIColor(rgb: 0x455a64)
//        public static let c800 = UIColor(rgb: 0x37474f)
//        public static let c900 = UIColor(rgb: 0x263238)
//    }
//    
//    public struct Netflix {
//        public static let light = UIColor(rgb: 0x485563)
//        public static let dark = UIColor(rgb: 0x29323c)
//    }
//    
//    public struct Gray {
//        public static let a800 = UIColor(rgb: 0x424242)
//        public static let mid = UIColor(rgb: 0x616161)
//        public static let light = UIColor(white: 230.0/255.0, alpha: 1)
//    }
//    
//    public struct Purple {
//        public static let a300 = UIColor(rgb: 0xba68c8)
//        public static let a400 = UIColor(rgb: 0xab47bc)
//        public static let a700 = UIColor(rgb: 0xaa00ff)
//        public static let deep = UIColor(rgb: 0x673ab7)
//    }
//    
//    public struct BlueGradient {
//        public static let light = UIColor(red: 100, green: 172, blue: 196)
//        public static let dark = UIColor(red: 27, green: 47, blue: 144)
//    }
//    
//    public struct Yellow {
//        public static let a700 = UIColor(rgb: 0xffd600)
//    }
//    
//    public struct Teal {
//        public static let a700 = UIColor(rgb: 0x00bfa5)
//        public static let a600 = UIColor(rgb: 0x00897b)
//    }
//    
//    public struct Orange {
//        public static let a50 = UIColor(rgb: 0xfff3e0)
//    }
//    
//    public struct LightBlue {
//        public static let a700 = UIColor(rgb: 0x0091ea)
//    }
//    
//    public struct LightPink {
//        public static let first = UIColor(rgb: 0xff9a9e)
//        public static let last = UIColor(rgb: 0xfad0c4)
//    }
//}
