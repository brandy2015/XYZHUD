 

import UIKit 
import Localize_Swift

public extension UIViewController{
  
    func popAlert()  {
        var displayMode: EKAttributes.DisplayMode {
            return PresetsDataSource.displayMode
        }
        let dataSource = PresetsDataSource()
        var attributes = dataSource.bottomAlertAttributes
        attributes.entryBackground = .color(color: Color.Teal.a600)
        attributes.entranceAnimation = .init(
            translate: .init(duration: 0.65, spring: .init(damping: 0.8, initialVelocity: 0))
        )
        let image = UIImage(named: "ic_success")
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
   
    
    func showWatingHUD(title:String = "请稍等".localized(),desc:String = "正在转换，稍等".localized(),imageName:String = "NextBTNXXX" ,duration:Double = 60.0) {
        var attibutes = PresetsDataSource()[3,0].attributes
        attibutes.displayMode = .inferred
        attibutes.displayDuration = EKAttributes.DisplayDuration(exactly: duration)!
        attibutes.position = .top
        showNotificationMessage(attributes: attibutes,title: title,desc: desc, textColor: .standardContent, imageName: imageName)
    }
    
    func showButtonBarMessagex跳转到相册吗(显示时间:Double = 1.5,AlertTitle:String = "保存成功".localized(),imageName:String = "",Content:String = "是否需要跳转到相册".localized(),OKBTN: (()->Void)? = nil,Failed: (()->Void)? = nil) {
        
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
    
    
    
    
    func SelectOneBTN(title:String = "请选择".localized(),text :String = "选择从什么类型转换为GIF".localized(),imageName:String = "Select_SwiftEntryBTN",BTN1: (()->Void)? = nil,BTN2: (()->Void)? = nil,BTN1Name:String = "从Live动态照片转换GIF".localized() ,BTN2Name:String = "从视频转换GIF".localized()) {
    
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
