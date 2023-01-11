 
import UIKit
 
public extension UIViewController{
    
    func DeleteInputPhoto(显示时间:Double = 3,AlertTitle:String = "是否删除".localized(),imageName:String = "",Content:String = "是否删除已导入照片在相册中的原照片".localized(),OKBTN: (()->Void)? = nil,Failed: (()->Void)? = nil) {
        
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
            text: "不删除保留".localized(),
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
            text: "删除原照片".localized(),
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
