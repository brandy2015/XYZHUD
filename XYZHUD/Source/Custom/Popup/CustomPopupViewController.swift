//
//  PopupViewController.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
//import PopupWindow


public class CustomPopupViewController: BasePopupViewController {

    public  var 显示时长 = 0.3
    public enum Const {
        static public var popupDuration: TimeInterval = 0.3
        static public var transformDuration: TimeInterval = 0.4
    }

    public var CustomPopupViewbackgroundColor = UIColor(red: 238/255, green: 64/255, blue: 86/255, alpha:1)
    
    public var titleString = "生成成功"
    public var descriptionString = "您可以在相册中查看"
    public var isTop: Bool = true
     public var popupItem: PopupItem?

     public let topPopupItem = PopupItem(view: DemoPopupView.view(),
                                         height: DemoPopupView.Const.height,
                                         maxWidth: 500,
                                         shapeType: .rounded(cornerSize: 8),
                                         viewType: .card,
                                         direction: .top,
                                         margin: 8,
                                         hasBlur: true,
                                         duration: Const.popupDuration)

     public let bottomPopupItem = PopupItem(view: DemoPopupView.view(),
                                            height: DemoPopupView.Const.height,
                                            maxWidth: 500,
                                            shapeType: .rounded(cornerSize: 8),
                                            viewType: .card,
                                            direction: .bottom,
                                            margin: 8,
                                            hasBlur: true,
                                            duration: Const.popupDuration)

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        Const.transformDuration = 显示时长
        
        if isTop {
            popupItem = topPopupItem
            configurePopupItem(popupItem!)
        } else {
            popupItem = bottomPopupItem
            configurePopupItem(popupItem!)
        }
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let popupItem = popupItem, let view = popupItem.view as? DemoPopupView {
            view.configureDemoPopupView(popupItem: popupItem)
            view.titleLabel.text = titleString
            view.descriptionLabel.text = descriptionString
            view.backgroundColor = CustomPopupViewbackgroundColor
            view.closeButtonTapHandler = { [weak self] in
                guard let me = self, let popupItem = me.popupItem else { return }
                me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: popupItem.direction) { _ in
                    PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
                }
            }
        }

        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) { [weak self] in
            guard let me = self, let popupItem = me.popupItem else { return }
            me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: popupItem.direction) { _ in }
        }
    }
}


