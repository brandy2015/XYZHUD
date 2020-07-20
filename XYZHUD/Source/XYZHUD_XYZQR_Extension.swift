//
//  XYZHUD_XYZQR_Extension.swift
//  XYZHUD
//
//  Created by 张子豪 on 2020/7/6.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public extension UIViewController{
    
    func XYZHUD显示(StringToShow:String)  {
        
        self._3showBarWaiting窄条(HUDName: StringToShow.localized())
        self.HUDDismiss(dismissTime: 3)
        
        
        //        self._4WaitingHUD窄条()
        //        self.HUDDismiss(dismissTime: 1.5)
    }
    
    func XYZHUD_()  {
        
        //        self._3showBarWaiting窄条(HUDName: "上传失败")
        self.HUDDismiss(dismissTime: 1.5)
        
        
        //        self._4WaitingHUD窄条()
        //        self.HUDDismiss(dismissTime: 1.5)
    }
    
    
//    func XYZHUD_dismiss()  {
//
//        self.HUDDismiss(dismissTime: 0.01)
//    }
    
    func XYZHUD_已从剪贴板复制()  {
        
        self._3showBarWaiting窄条(HUDName: "已从剪贴板复制")
        self.HUDDismiss(dismissTime: 1.5)
        
        
        //        self._4WaitingHUD窄条()
        //        self.HUDDismiss(dismissTime: 1.5)
    }
    func XYZHUD_正在加密()  {
        
        self._3showBarWaiting窄条(HUDName: "稍等正在加密")
        self.HUDDismiss(dismissTime: 1.5)
        
        
        //        self._4WaitingHUD窄条()
        //        self.HUDDismiss(dismissTime: 1.5)
    }
//    func XYZHUD_上传成功()  {
//        self._3showBarWaiting窄条()
//        self.HUDDismiss(dismissTime: 1.5)
//    }
//    func XYZHUD_上传中请等待()  {
//        _4WaitingHUD窄条()
//    }
    
    
    
    
}



import UIKit
import SwiftEntryKit

public extension UIViewController{
    
    func 判断是否跳转到Safari(显示时间:Double = 1.5,AlertTitle:String = "保存成功".localized(),closeButtonLabel:String = "不跳转",okButtonLabel:String = "跳转",imageName:String = "ShareBTNXX",Content:String = "是否需要跳转到相册".localized(),OKBTN: (()->Void)? = nil,Failed: (()->Void)? = nil ) {
        
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
            text: closeButtonLabel,
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
            text: okButtonLabel,
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
    
}
