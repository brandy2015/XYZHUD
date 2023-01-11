 

import UIKit 

extension UIViewController{
    
    // MARK: - Properties
    
    var displayMode: EKAttributes.DisplayMode {
        return PresetsDataSource.displayMode
    }
    
    enum DisplayModeSegment: Int {
        case light
        case dark
        case inferred
        
        var displayMode: EKAttributes.DisplayMode {
            switch self {
            case .light:
                return .light
            case .dark:
                return .dark
            case .inferred:
                return .inferred
            }
        }
    }
    
    
    // MARK: Entry Samples
    // Bumps a standard note
    func showNote(Text:String = "Waiting for the goodies to arrive!",attributes: EKAttributes) {
        let text = Text//"Pssst! I have something to tell you..."
        let style = EKProperty.LabelStyle(
            font: MainFont.light.with(size: 14),
            color: .white,
            alignment: .center
        )
        let labelContent = EKProperty.LabelContent(
            text: text,
            style: style
        )
        let contentView = EKNoteMessageView(with: labelContent)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    
    
       func showImageNote(attributes: EKAttributes) {
        let text = "The thrill is gone"
        let style = EKProperty.LabelStyle(
            font: MainFont.light.with(size: 14),
            color: .white,
            alignment: .center,
            displayMode: displayMode
        )
        let labelContent = EKProperty.LabelContent(
            text: text,
            style: style
        )
        let imageContent = EKProperty.ImageContent(
            image: (UIImage(named: "ic_wifi") ?? UIImage()),
            displayMode: displayMode
        )
        let contentView = EKImageNoteMessageView(
            with: labelContent,
            imageContent: imageContent
        )
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
       func showAnimatingImageNote(attributes: EKAttributes) {
        let text = "Up and charge"
        let style = EKProperty.LabelStyle(
            font: MainFont.light.with(size: 14),
            color: .black,
            alignment: .center,
            displayMode: displayMode
        )
        let labelContent = EKProperty.LabelContent(
            text: text,
            style: style
        )
        let sequence = (0...5).map { "battery\($0)" }
        let animationDuration: TimeInterval = 1
        let animation = EKProperty.ImageContent.TransformAnimation.animate(
            duration: animationDuration,
            options: [.curveEaseInOut],
            transform: .init(scaleX: 1.1, y: 1.1)
        )
        let imageContent = EKProperty.ImageContent(
            imagesNames: sequence,
            imageSequenceAnimationDuration: animationDuration,
            displayMode: displayMode,
            animation: animation,
            size: CGSize(width: 16, height: 16),
            tint: .black,
            contentMode: .scaleAspectFit
        )
        let contentView = EKImageNoteMessageView(
            with: labelContent,
            imageContent: imageContent
        )
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func showProcessingNote(Text:String = "Waiting for the goodies to arrive!",attributes: EKAttributes) {
        let text = Text
        let style = EKProperty.LabelStyle(
            font: MainFont.light.with(size: 14),
            color: .white,
            alignment: .center,
            displayMode: displayMode
        )
        let labelContent = EKProperty.LabelContent(
            text: text,
            style: style
        )
        let contentView = EKProcessingNoteMessageView(
            with: labelContent,
            activityIndicator: .white
        )
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func showStatusBarMessage(LeftString:String = "My 🧠",trailing:String = "Wonders!",attributes: EKAttributes) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.maxY
        let contentView: UIView
        let font = MainFont.light.with(size: 12)
        let labelStyle = EKProperty.LabelStyle(
            font: font,
            color: .white,
            alignment: .center,
            displayMode: displayMode
        )
        if statusBarHeight > 20 {
            let leading = EKProperty.LabelContent(
                text: "My 🧠",
                style: labelStyle
            )
            let trailing = EKProperty.LabelContent(
                text: "Wonders!",
                style: labelStyle
            )
            contentView = EKXStatusBarMessageView(
                leading: leading,
                trailing: trailing
            )
        } else {
            let labelContent = EKProperty.LabelContent(
                text: "My 🧠 is doing some thinking...",
                style: labelStyle
            )
            let noteView = EKNoteMessageView(with: labelContent)
            noteView.verticalOffset = 0
            noteView.set(.height, of: statusBarHeight)
            contentView = noteView
        }
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    
    // Show rating view
       func showRatingView(attributes: EKAttributes) {
        let unselectedImage = EKProperty.ImageContent(
            image: (UIImage(named: "ic_star_unselected") ?? UIImage()).withRenderingMode(.alwaysTemplate),
            displayMode: displayMode,
            tint: .standardContent
        )
        let selectedImage = EKProperty.ImageContent(
            image: (UIImage(named: "ic_star_selected") ?? UIImage()).withRenderingMode(.alwaysTemplate),
            displayMode: displayMode,
            tint: EKColor.ratingStar
        )
        let initialTitle = EKProperty.LabelContent(
            text: "Rate our food",
            style: .init(
                font: MainFont.medium.with(size: 34),
                color: .standardContent,
                alignment: .center,
                displayMode: displayMode
            )
        )
        let initialDescription = EKProperty.LabelContent(
            text: "How was it?",
            style: .init(
                font: MainFont.light.with(size: 24),
                color: EKColor.standardContent.with(alpha: 0.5),
                alignment: .center,
                displayMode: displayMode
            )
        )
        let items = [("💩", "Pooish!"), ("🤨", "Ahhh?!"), ("👍", "OK!"),
                     ("👌", "Tasty!"), ("😋", "Delicius!")].map { texts -> EKProperty.EKRatingItemContent in
                        let itemTitle = EKProperty.LabelContent(
                            text: texts.0,
                            style: .init(
                                font: MainFont.medium.with(size: 48),
                                color: .standardContent,
                                alignment: .center,
                                displayMode: displayMode
                            )
                        )
                        let itemDescription = EKProperty.LabelContent(
                            text: texts.1,
                            style: .init(
                                font: MainFont.light.with(size: 24),
                                color: .standardContent,
                                alignment: .center,
                                displayMode: displayMode
                            )
                        )
                        return EKProperty.EKRatingItemContent(
                            title: itemTitle,
                            description: itemDescription,
                            unselectedImage: unselectedImage,
                            selectedImage: selectedImage
                        )
        }
        
        var message: EKRatingMessage!
        let lightFont = MainFont.light.with(size: 20)
        let mediumFont = MainFont.medium.with(size: 20)
        let closeButtonLabelStyle = EKProperty.LabelStyle(
            font: mediumFont,
            color: .standardContent,
            displayMode: displayMode
        )
        let closeButtonLabel = EKProperty.LabelContent(
            text: "Dismiss",
            style: closeButtonLabelStyle
        )
        let closeButton = EKProperty.ButtonContent(
            label: closeButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: EKColor.standardBackground.with(alpha: 0.2),
            displayMode: displayMode) {
                SwiftEntryKit.dismiss {
                    // Here you may perform a completion handler
                }
        }
        
        let pinkyColor = EKColor.pinky
        let okButtonLabelStyle = EKProperty.LabelStyle(
            font: lightFont,
            color: pinkyColor,
            displayMode: displayMode
        )
        let okButtonLabel = EKProperty.LabelContent(
            text: "Tell us more",
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: pinkyColor.with(alpha: 0.05),
            displayMode: displayMode) {
                SwiftEntryKit.dismiss()
        }
        let buttonsBarContent = EKProperty.ButtonBarContent(
            with: closeButton, okButton,
            separatorColor: EKColor(light: Color.Gray.light.light, dark: Color.Gray.mid.light),
            horizontalDistributionThreshold: 1,
            displayMode: displayMode,
            expandAnimatedly: true
        )
        message = EKRatingMessage(
            initialTitle: initialTitle,
            initialDescription: initialDescription,
            ratingItems: items,
            buttonBarContent: buttonsBarContent) { index in
                // Rating selected - do something
        }
        let contentView = EKRatingMessageView(with: message)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    
    // Bumps a notification structured entry
       func showNotificationMessage(attributes: EKAttributes,
                                         title: String,
                                         desc: String,
                                         textColor: EKColor,
                                         imageName: String? = nil) {
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: MainFont.medium.with(size: 16),
                color: textColor,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "title"
        )
        let description = EKProperty.LabelContent(
            text: desc,
            style: .init(
                font: MainFont.light.with(size: 14),
                color: textColor,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "description"
        )
        var image: EKProperty.ImageContent?
        if let imageName = imageName {
            image = EKProperty.ImageContent(
                image: (UIImage(named: imageName) ?? UIImage()).withRenderingMode(.alwaysTemplate),
                displayMode: displayMode,
                size: CGSize(width: 35, height: 35),
                tint: textColor,
                accessibilityIdentifier: "thumbnail"
            )
        }
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    // Bumps a chat message structured entry
       func showChatNotificationMessage(attributes: EKAttributes) {
        let title = EKProperty.LabelContent(
            text: "Madi",
            style: .init(
                font: MainFont.medium.with(size: 14),
                color: .white,
                displayMode: displayMode
            )
        )
        let description = EKProperty.LabelContent(
            text: "Hey! I'll come by at your office for lunch... 🍲",
            style: .init(
                font: MainFont.light.with(size: 12),
                color: .white,
                displayMode: displayMode
            )
        )
        let time = EKProperty.LabelContent(
            text: "09:00",
            style: .init(
                font: MainFont.light.with(size: 10),
                color: .white,
                displayMode: displayMode
            )
        )
        let image = EKProperty.ImageContent.thumb(
            with: "ic_madi_profile",
            edgeSize: 35
        )
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let notificationMessage = EKNotificationMessage(
            simpleMessage: simpleMessage,
            auxiliary: time
        )
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
       func showDarkAwesomePopupMessage(attributes: EKAttributes) {
        let image = (UIImage(named: "ic_done_all_dark_48pt") ?? UIImage()).withRenderingMode(.alwaysTemplate)
        let title = "Awesome!"
        let description =
        """
        You are using SwiftEntryKit, \
        and this is a customized alert \
        view that is floating at the bottom.
        """
        showPopupMessage(attributes: attributes,
                         title: title,
                         titleColor: .text,
                         description: description,
                         descriptionColor: .subText,
                         buttonTitleColor: .white,
                         buttonBackgroundColor: .amber,
                         image: image)
    }
    
       func showLightAwesomePopupMessage(attributes: EKAttributes) {
        let image = (UIImage(named: "ic_done_all_light_48pt") ?? UIImage()).withRenderingMode(.alwaysTemplate)
        let title = "Awesome!"
        let description = "You are using SwiftEntryKit, and this is a pop up with important content"
        showPopupMessage(attributes: attributes,
                         title: title,
                         titleColor: .white,
                         description: description,
                         descriptionColor: .white,
                         buttonTitleColor: Color.Gray.mid,
                         buttonBackgroundColor: .white,
                         image: image)
    }
    
       func showPopupMessage(attributes: EKAttributes,
                                  title: String,
                                  titleColor: EKColor,
                                  description: String,
                                  descriptionColor: EKColor,
                                  buttonTitleColor: EKColor,
                                  buttonBackgroundColor: EKColor,
                                  image: UIImage? = nil) {
        
        var themeImage: EKPopUpMessage.ThemeImage?
        
        if let image = image {
            themeImage = EKPopUpMessage.ThemeImage(
                image: EKProperty.ImageContent(
                    image: image,
                    displayMode: displayMode,
                    size: CGSize(width: 60, height: 60),
                    tint: titleColor,
                    contentMode: .scaleAspectFit
                )
            )
        }
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: MainFont.medium.with(size: 24),
                color: titleColor,
                alignment: .center,
                displayMode: displayMode
            )
        )
        let description = EKProperty.LabelContent(
            text: description,
            style: .init(
                font: MainFont.light.with(size: 16),
                color: descriptionColor,
                alignment: .center,
                displayMode: displayMode
            )
        )
        let button = EKProperty.ButtonContent(
            label: .init(
                text: "Got it!",
                style: .init(
                    font: MainFont.bold.with(size: 16),
                    color: buttonTitleColor,
                    displayMode: displayMode
                )
            ),
            backgroundColor: buttonBackgroundColor,
            highlightedBackgroundColor: buttonTitleColor.with(alpha: 0.05),
            displayMode: displayMode
        )
        let message = EKPopUpMessage(
            themeImage: themeImage,
            title: title,
            description: description,
            button: button) {
                SwiftEntryKit.dismiss()
        }
        let contentView = EKPopUpMessageView(with: message)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
       func showButtonBarMessage(attributes: EKAttributes) {
        let title = EKProperty.LabelContent(
            text: "Dear Reader!",
            style: .init(
                font: MainFont.medium.with(size: 15),
                color: .black,
                displayMode: displayMode
            )
        )
        let description = EKProperty.LabelContent(
            text: "Get your coupon for a free book now",
            style: .init(
                font: MainFont.light.with(size: 13),
                color: .black,
                displayMode: displayMode
            )
        )
        let image = EKProperty.ImageContent(
            imageName: "ic_books",
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
            text: "NOT NOW",
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
            text: "LET ME HAVE IT",
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: Color.Teal.a600.with(alpha: 0.05),
            displayMode: displayMode) { [unowned self] in
                // MARK: - Properties
                
                  var displayMode: EKAttributes.DisplayMode {
                    return PresetsDataSource.displayMode
                    
                }
                let dataSource = PresetsDataSource()
                var attributes = dataSource.bottomAlertAttributes
                attributes.entryBackground = .color(color: Color.Teal.a600)
                attributes.entranceAnimation = .init(
                    translate: .init(duration: 0.65, spring: .init(damping: 0.8, initialVelocity: 0))
                )
                let image = UIImage(named: "ic_success")  ?? UIImage()
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
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
       func showAlertView(attributes: EKAttributes) {
        let title = EKProperty.LabelContent(
            text: "Hopa!",
            style: .init(
                font: MainFont.medium.with(size: 15),
                color: .black,
                alignment: .center,
                displayMode: displayMode
            )
        )
        let text =
        """
        This is a system-like alert, with several buttons. \
        You can display even more buttons if you want. \
        Click on one of them to dismiss it.
        """
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
            imageName: "ic_apple",
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
            text: "NOT NOW",
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
            text: "MAYBE LATER",
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
            text: "SHOW ME",
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
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    // Bumps a navigation controller
          func showNavigationController(with attributes: EKAttributes) {
           let viewController = ContactsViewController()
           let navigationController = ExampleNavigationViewController(rootViewController: viewController)
           SwiftEntryKit.display(entry: navigationController, using: attributes)
       }
       
       // Bumps a custom nib originated view
          func showCustomNibView(attributes: EKAttributes) {
           SwiftEntryKit.display(entry: NibExampleView(), using: attributes)
       }
       
       // Bumps a custom view controller that is using a view from nib
          func showCustomViewController(attributes: EKAttributes) {
           let viewController = ExampleViewController(with: NibExampleView())
           SwiftEntryKit.display(entry: viewController, using: attributes)
       }
       
       // Sign in form
          func showSigninForm(attributes: EKAttributes, style: FormStyle) {
           let titleStyle = EKProperty.LabelStyle(
               font: MainFont.medium.with(size: 16),
               color: .standardContent,
               alignment: .center,
               displayMode: displayMode
           )
           let title = EKProperty.LabelContent(
               text: "Sign in to your account",
               style: titleStyle
           )
           let textFields = FormFieldPresetFactory.fields(
               by: [.email, .password],
               style: style
           )
           let button = EKProperty.ButtonContent(
               label: .init(text: "Continue", style: style.buttonTitle),
               backgroundColor: style.buttonBackground,
               highlightedBackgroundColor: style.buttonBackground.with(alpha: 0.8),
               displayMode: displayMode,
               accessibilityIdentifier: "continueButton") {
                   SwiftEntryKit.dismiss()
           }
           let contentView = EKFormMessageView(
               with: title,
               textFieldsContent: textFields,
               buttonContent: button
           )
           SwiftEntryKit.display(entry: contentView, using: attributes)
       }
       
       // Sign up form
          func showSignupForm(attributes: inout EKAttributes, style: FormStyle) {
           let titleStyle = EKProperty.LabelStyle(
               font: MainFont.light.with(size: 14),
               color: style.textColor,
               displayMode: displayMode
           )
           let title = EKProperty.LabelContent(
               text: "Fill your personal details",
               style: titleStyle
           )
           let textFields = FormFieldPresetFactory.fields(
               by: [.fullName, .mobile, .email, .password],
               style: style
           )
           let button = EKProperty.ButtonContent(
               label: .init(text: "Continue", style: style.buttonTitle),
               backgroundColor: style.buttonBackground,
               highlightedBackgroundColor: style.buttonBackground.with(alpha: 0.8),
               displayMode: displayMode) {
                   SwiftEntryKit.dismiss()
           }
           let contentView = EKFormMessageView(
               with: title,
               textFieldsContent: textFields,
               buttonContent: button
           )
           attributes.lifecycleEvents.didAppear = {
               contentView.becomeFirstResponder(with: 0)
           }
           SwiftEntryKit.display(entry: contentView, using: attributes, presentInsideKeyWindow: true)
       }
    
    
    
}
