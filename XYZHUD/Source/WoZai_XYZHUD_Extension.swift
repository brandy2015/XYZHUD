//
//  XYZHUD_VTLMaker_Extension.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/11/7.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit
import SwiftEntryKit
//import XYZHUD
//import XYZVCX
//import SoHow

 //登录系列
public extension UIViewController{
    func XYZHUD_正在登录() {
        _1showWatingHUD宽条(title: "稍等", HUDName: "正在登录", image: "HUD_Waiting")
        
    }
    
    func XYZHUD_登录失败_未知原因() {
        
        _1showWatingHUD宽条(title: "失败", HUDName: "失败原因404未知原因", image: "HUD_Error")
    }
    
    func XYZHUD_登录失败_网络() {
        
        _1showWatingHUD宽条(title: "登录失败", HUDName: "网络不好", image: "HUD_noCellular")
    }
    
    func XYZHUD_登录失败_原因(原因:String = "原因未知") {
        
        _1showWatingHUD宽条(title: "登录失败", HUDName: 原因, image: "HUD_Error")
    }
    
    func XYZHUD_登录成功() {
        
        _1showWatingHUD宽条(title: "登录成功", HUDName: "稍等正在跳转", image: "HUD_Yes")
    }
    
    func XYZHUD_登录失败_密码() {
        _1showWatingHUD宽条(title: "登录失败", HUDName: "密码输入错误", image: "HUD_Warning")
    }
}


//上传系列
public extension UIViewController{
    func XYZHUD_dismiss()  {
        
        self.HUDDismiss(dismissTime: 0.01)
    }
    
    func XYZHUD_上传失败()  {
        
        self._3showBarWaiting窄条(HUDName: "上传失败")
        self.HUDDismiss(dismissTime: 1.5)
        
        
//        self._4WaitingHUD窄条()
//        self.HUDDismiss(dismissTime: 1.5)
    }
    func XYZHUD_上传成功()  {
        self._3showBarWaiting窄条()
        self.HUDDismiss(dismissTime: 1.5)
    }
    func XYZHUD_上传中请等待()  {
        _4WaitingHUD窄条()
    }
    
    
    
    
}

public extension UIViewController{
    //    afterDelay(0.1) {self._1showWatingHUD全屏()}
    //    afterDelay(3) {self._1showWatingHUD宽条()}//毛玻璃请稍等
    //    afterDelay(5) { self._6showButtonBarMessagex跳转相册()}
    //    _3showBarWaiting窄条() //上传成功提醒
    //     _7popAlert()//底下向上弹出
    //     _4WaitingHUD窄条()//准备使用的
    
    //    HUDDismiss()
    func HUDDismiss(dismissTime:Double = 0.01)  {
        afterDelay(dismissTime) {
            SwiftEntryKit.dismiss()
        }
        
    }
    
    func _1showWatingHUD全屏(title:String = "请稍等", HUDName :String =  "正在转换，稍等",image:String = "Tab_BrainStormBar") {
        
        //        0，1是全屏
        //       2-0  2-5也行彩色黄红
        
        
        //        3，2粉红圆角很好底下
        //        3，3飞入
        // 1,0也很好
        //        4-0毛玻璃
        //             4-2从底下弹出
        
        //        3-0稍等界面
        //        5-0从底下弹出VC  5-1透明
        var attibutes = PresetsDataSource()[0,1].attributes
        attibutes.displayMode = .inferred
        attibutes.displayDuration = .infinity
        attibutes.position = .top
        showNotificationMessage(attributes: attibutes,
                                title: title,
                                desc: HUDName,
                                textColor: .standardContent,
                                imageName: image)
    }
    
    func _1showWatingHUD宽条(title:String = "请稍等", HUDName :String =  "正在转换，稍等",image:String = "Tab_BrainStormBar") {
        //        毛玻璃
        var attibutes = PresetsDataSource()[4,0].attributes
        attibutes.displayMode = .inferred
        attibutes.displayDuration = .infinity
        attibutes.position = .top
        showNotificationMessage(attributes: attibutes,
                                title: title,
                                desc: HUDName,
                                textColor: .standardContent,
                                imageName: image)
    }
    func _2WaitingHUD窄条宽一点(LeftString:String = "My 🧠",trailing:String = "Wonders!") {
        let dataSource = PresetsDataSource()
        let attributes = dataSource[4, 0].attributes
        
        showStatusBarMessage(LeftString: LeftString, trailing: trailing, attributes: attributes)
        
        
    }
    
    
    func _3showBarWaiting窄条(HUDName :String = "上传成功")  {
        let dataSource = PresetsDataSource()
        let attributes = dataSource[4, 0].attributes
        showNote(Text: HUDName, attributes: attributes)
        //        noteCellSelected(with: attributes, row: 1)
    }
    
    func _4WaitingHUD窄条(HUDName :String = "正在上传ing")  {
        let dataSource = PresetsDataSource()
        let attributes = dataSource[4, 0].attributes
        showProcessingNote(Text: HUDName, attributes: attributes)
    }
    
}


//HUD
public extension UIViewController{
    
    
    func _5showAlertViewx多项选择(title:String = "请选择",text :String = "选择从什么类型转换为GIF",imageName:String = "xuanze") {
        
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: MainFont.medium.with(size: 15),
                color: .black,
                alignment: .center,
                displayMode: displayMode
            )
        )
        
        
        let description = EKProperty.LabelContent(
            text: text,
            style: .init(
                font: MainFont.light.with(size: 13),
                color: .black,
                alignment: .center,
                displayMode: displayMode
            )
        )
        let image = EKProperty.ImageContent(
            imageName: imageName,
            displayMode: displayMode,
            size: CGSize(width: 25, height: 25),
            contentMode: .scaleAspectFit
        )
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let buttonFont = MainFont.medium.with(size: 16)
        let closeButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Gray.a800,
            displayMode: displayMode
        )
        let closeButtonLabel = EKProperty.LabelContent(
            text: "取消",
            style: closeButtonLabelStyle
        )
        let closeButton = EKProperty.ButtonContent(
            label: closeButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Gray.a800.with(alpha: 0.05),
            displayMode: displayMode) {
                SwiftEntryKit.dismiss()
        }
        let laterButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Teal.a600,
            displayMode: displayMode
        )
        let laterButtonLabel = EKProperty.LabelContent(
            text: "从视频转换GIF",
            style: laterButtonLabelStyle
        )
        let laterButton = EKProperty.ButtonContent(
            label: laterButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
            displayMode: displayMode) {
                SwiftEntryKit.dismiss()
        }
        let okButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Teal.a600,
            displayMode: displayMode
        )
        let okButtonLabel = EKProperty.LabelContent(
            text: "从Live动态照片转换GIF",
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
            displayMode: displayMode) {
                SwiftEntryKit.dismiss()
        }
        // Generate the content
        let buttonsBarContent = EKProperty.ButtonBarContent(
            with: okButton, laterButton, closeButton,
            separatorColor: Color.Gray.light,
            displayMode: displayMode,
            expandAnimatedly: true
        )
        let alertMessage = EKAlertMessage(
            simpleMessage: simpleMessage,
            buttonBarContent: buttonsBarContent
        )
        let contentView = EKAlertMessageView(with: alertMessage)
        let attributes = PresetsDataSource()[3,4].attributes
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    func _6showButtonBarMessagex跳转相册(AlertTitle:String = "保存成功",Content:String = "是否需要跳转到相册",imageName:String = "xuanze") {
        
        var attributes = PresetsDataSource()[3,0].attributes
        
        let title = EKProperty.LabelContent(
            text: AlertTitle,
            style: .init(
                font: MainFont.medium.with(size: 15),
                color: .standardContent,
                displayMode: displayMode
            )
        )
        let description = EKProperty.LabelContent(
            text: Content,
            style: .init(
                font: MainFont.light.with(size: 13),
                color: .standardContent,
                displayMode: displayMode
            )
        )
        let image = EKProperty.ImageContent(
            imageName: imageName,
            displayMode: displayMode,
            size: CGSize(width: 35, height: 35),
            contentMode: .scaleAspectFit
        )
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let buttonFont = MainFont.medium.with(size: 16)
        let closeButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Gray.a800,
            displayMode: displayMode
        )
        let closeButtonLabel = EKProperty.LabelContent(
            text: "不跳转",
            style: closeButtonLabelStyle
        )
        let closeButton = EKProperty.ButtonContent(
            label: closeButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Gray.a800.with(alpha: 0.05)) {
                SwiftEntryKit.dismiss()
        }
        let okButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Teal.a600,
            displayMode: displayMode
        )
        let okButtonLabel = EKProperty.LabelContent(
            text: "跳转到相册",
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
            displayMode: displayMode) { [unowned self] in
                // MARK: - Properties
                
                //                self.popAlert()
                print("准备跳转到相册")
                
                
        }
        let buttonsBarContent = EKProperty.ButtonBarContent(
            with: closeButton, okButton,
            separatorColor: Color.Gray.light,
            buttonHeight: 60,
            displayMode: displayMode,
            expandAnimatedly: true
        )
        let alertMessage = EKAlertMessage(
            simpleMessage: simpleMessage,
            imagePosition: .left,
            buttonBarContent: buttonsBarContent
        )
        let contentView = EKAlertMessageView(with: alertMessage)
        attributes.position = EKAttributes.Position.top
        attributes.displayDuration = EKAttributes.DisplayDuration(exactly: 1.0)!
        
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    func _7popAlert(imageName:String = "xuanze") {
        var displayMode: EKAttributes.DisplayMode {
            return PresetsDataSource.displayMode
        }
        let dataSource = PresetsDataSource()
        var attributes = dataSource.bottomAlertAttributes
        attributes.entryBackground = .color(color: Color.Teal.a600)
        attributes.entranceAnimation = .init(
            translate: .init(duration: 0.65, spring: .init(damping: 0.8, initialVelocity: 0))
        )
        let image = UIImage(named:imageName)!
        let title = "Congratz!"
        let description = "Your book coupon is 5w1ft3ntr1k1t"
        self.showPopupMessage(attributes: attributes,
                              title: title,
                              titleColor: .white,
                              description: description,
                              descriptionColor: .white,
                              buttonTitleColor: .subText,
                              buttonBackgroundColor: .white,
                              image: image)
    }
    
    
    
}


class XYZHUD_VTLMaker_Extension: NSObject {

}
//DispatchQueue.main.async {self.showWatingHUD(title: "请稍等".localized(), desc: "松手后开启强制转换".localized(), duration: 2)}

public extension UIViewController{
//   func popAlert()  {
//        var displayMode: EKAttributes.DisplayMode {
//            return PresetsDataSource.displayMode
//        }
//        let dataSource = PresetsDataSource()
//        var attributes = dataSource.bottomAlertAttributes
//        attributes.entryBackground = .color(color: Color.Teal.a600)
//        attributes.entranceAnimation = .init(
//            translate: .init(duration: 0.65, spring: .init(damping: 0.8, initialVelocity: 0))
//        )
//        let image = UIImage(named: "ic_success")!
//        let title = "Congratz!"
//        let description = "Your book coupon is 5w1ft3ntr1k1t"
//        self.showPopupMessage(attributes: attributes,
//                              title: title,
//                              titleColor: .white,
//                              description: description,
//                              descriptionColor: .white,
//                              buttonTitleColor: .subText,
//                              buttonBackgroundColor: .white,
//                              image: image)
//    }
   
    
    func showWatingHUDZ(title:String = "请稍等".localized(),desc:String = "正在转换，稍等".localized(),imageName:String = "NextBTNXXX".localized(),duration:Double = 60.0) {
        var attibutes = PresetsDataSource()[3,0].attributes
        attibutes.displayMode = .inferred
        attibutes.displayDuration = EKAttributes.DisplayDuration(exactly: duration)!
        attibutes.position = .top
        showNotificationMessage(attributes: attibutes,title: title,desc: desc, textColor: .standardContent, imageName: imageName)
    }
    
    func showButtonBarMessagex跳转到相册吗Z(显示时间:Double = 1.5,AlertTitle:String = "保存成功".localized(),imageName:String = "",Content:String = "是否需要跳转到相册".localized(),OKBTN: (()->Void)? = nil,Failed: (()->Void)? = nil) {
        
        var attributes = PresetsDataSource()[3,0].attributes
        
        let title = EKProperty.LabelContent(
            text: AlertTitle,
            style: .init(
                font: MainFont.medium.with(size: 15),
                color: .standardContent,
                displayMode: displayMode
            )
        )
        let description = EKProperty.LabelContent(
            text: Content,
            style: .init(
                font: MainFont.light.with(size: 13),
                color: .standardContent,
                displayMode: displayMode
            )
        )
        let image = EKProperty.ImageContent(
            imageName: "ShareBTNXX",
            displayMode: displayMode,
            size: CGSize(width: 35, height: 35),
            contentMode: .scaleAspectFit
        )
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let buttonFont = MainFont.medium.with(size: 16)
        let closeButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Gray.a800,
            displayMode: displayMode
        )
        let closeButtonLabel = EKProperty.LabelContent(
            text: "不跳转".localized(),
            style: closeButtonLabelStyle
        )
        let closeButton = EKProperty.ButtonContent(
            label: closeButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Gray.a800.with(alpha: 0.05)) {
                SwiftEntryKit.dismiss()
        }
        let okButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: Color.Teal.a600,
            displayMode: displayMode
        )
        let okButtonLabel = EKProperty.LabelContent(
            text: "跳转到相册".localized(),
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
            displayMode: displayMode) {// MARK: - Properties
                OKBTN?()
        }
        
        let buttonsBarContent = EKProperty.ButtonBarContent(
            with: closeButton, okButton,
            separatorColor: Color.Gray.light,
            buttonHeight: 60,
            displayMode: displayMode,
            expandAnimatedly: true
        )
        let alertMessage = EKAlertMessage(
            simpleMessage: simpleMessage,
            imagePosition: .left,
            buttonBarContent: buttonsBarContent
        )
        let contentView = EKAlertMessageView(with: alertMessage)
        attributes.position = EKAttributes.Position.top
        attributes.displayDuration = EKAttributes.DisplayDuration(exactly: 显示时间)!
        
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    
    
    func SelectOneBTNZ(title:String = "请选择".localized(),text :String = "选择从什么类型转换为GIF".localized(),imageName:String = "Select_SwiftEntryBTN",BTN1: (()->Void)? = nil,BTN2: (()->Void)? = nil,BTN1Name:String = "从Live动态照片转换GIF".localized() ,BTN2Name:String = "从视频转换GIF".localized()) {
    
         let title = EKProperty.LabelContent(
             text: title,
             style: .init(
                 font: MainFont.medium.with(size: 15),
                 color: .black,
                 alignment: .center,
                 displayMode: displayMode
             )
         )
         
     
         let description = EKProperty.LabelContent(
             text: text,
             style: .init(
                 font: MainFont.light.with(size: 13),
                 color: .black,
                 alignment: .center,
                 displayMode: displayMode
             )
         )
         let image = EKProperty.ImageContent(
             imageName: imageName,
             displayMode: displayMode,
             size: CGSize(width: 25, height: 25),
             contentMode: .scaleAspectFit
         )
         let simpleMessage = EKSimpleMessage(
             image: image,
             title: title,
             description: description
         )
         let buttonFont = MainFont.medium.with(size: 16)
         let closeButtonLabelStyle = EKProperty.LabelStyle(
             font: buttonFont,
             color: Color.Gray.a800,
             displayMode: displayMode
         )
         let closeButtonLabel = EKProperty.LabelContent(
            text: "取消".localized(),
             style: closeButtonLabelStyle
         )
         let closeButton = EKProperty.ButtonContent(
             label: closeButtonLabel,
             backgroundColor: .clear,
             highlightedBackgroundColor: Color.Gray.a800.with(alpha: 0.05),
             displayMode: displayMode) {
                 SwiftEntryKit.dismiss()
         }
         let laterButtonLabelStyle = EKProperty.LabelStyle(
             font: buttonFont,
             color: Color.Teal.a600,
             displayMode: displayMode
         )
         let laterButtonLabel = EKProperty.LabelContent(
             text: BTN2Name,
             style: laterButtonLabelStyle
         )
         let laterButton = EKProperty.ButtonContent(
             label: laterButtonLabel,
             backgroundColor: .clear,
             highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
             displayMode: displayMode) {
                 
                BTN2?()
                SwiftEntryKit.dismiss()
         }
         let okButtonLabelStyle = EKProperty.LabelStyle(
             font: buttonFont,
             color: Color.Teal.a600,
             displayMode: displayMode
         )
         let okButtonLabel = EKProperty.LabelContent(
             text: BTN1Name,
             style: okButtonLabelStyle
         )
         let okButton = EKProperty.ButtonContent(
             label: okButtonLabel,
             backgroundColor: .clear,
             highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
             displayMode: displayMode) {
              
                BTN1?()
                 SwiftEntryKit.dismiss()
         }
         // Generate the content
         let buttonsBarContent = EKProperty.ButtonBarContent(
             with: okButton, laterButton, closeButton,
             separatorColor: Color.Gray.light,
             displayMode: displayMode,
             expandAnimatedly: true
         )
         let alertMessage = EKAlertMessage(
             simpleMessage: simpleMessage,
             buttonBarContent: buttonsBarContent
         )
         let contentView = EKAlertMessageView(with: alertMessage)
         let attributes = PresetsDataSource()[3,4].attributes
         SwiftEntryKit.display(entry: contentView, using: attributes)
     }
     
    
    
}
//延迟调用
private func afterDelay(_ seconds: Double, closure: @escaping () -> ()) {
    let when = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
