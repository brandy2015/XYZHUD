//
//  PopupWindowManager.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

public class PopupWindowManager {
    public var popupContainerWindow: PopupContainerWindow?

    public static let shared = PopupWindowManager()
    private init() {
    }

    public func changeKeyWindow(rootViewController: UIViewController?) {
        if let rootViewController = rootViewController {
            popupContainerWindow = PopupContainerWindow()
            guard let popupContainerWindow = popupContainerWindow, rootViewController is BasePopupViewController else { return }
            popupContainerWindow.frame = UIScreen.main.bounds
            popupContainerWindow.backgroundColor = .clear
            popupContainerWindow.windowLevel = UIWindow.Level.statusBar + 1
            popupContainerWindow.rootViewController = rootViewController
            popupContainerWindow.makeKeyAndVisible()
        } else {
            popupContainerWindow?.rootViewController = nil
            popupContainerWindow = nil
            guard let keywindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene ,let keywindow = keywindowScene.windows.first else{return}
            keywindow.makeKeyAndVisible()
        }
    }
}
