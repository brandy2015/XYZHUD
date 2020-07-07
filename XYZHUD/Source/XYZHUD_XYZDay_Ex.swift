//
//  XYZHUD_Ex.swift
//  XYZTodo
//
//  Created by 张子豪 on 2020/5/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import SwiftEntryKit
 

extension NSObject{
    func popAlertXXss(VC:UIViewController,title:String,description:String,image:UIImage? = nil,AlertColor:EKAttributes.BackgroundStyle = .color(color: Color.Teal.a600))  {
        var displayMode: EKAttributes.DisplayMode {
            return PresetsDataSource.displayMode
        }
        let dataSource = PresetsDataSource()
        var attributes = dataSource.bottomAlertAttributes
        attributes.position = .center
        //        attributes.screenBackground = .clear
        
        attributes.entryBackground = AlertColor//.color(color: Color.Teal.a600)
        
        attributes.entranceAnimation = .init(
            translate: .init(duration: 0.65, spring: .init(damping: 0.8, initialVelocity: 0))
        )
//        let image = UIImage(named: "ic_success")!
//        let title = "Congratz!"
//        let description = "Your book coupon is 5w1ft3ntr1k1t"
       
        VC.showPopupMessage(attributes: attributes,
                              title: title,
                              titleColor: .white,
                              description: description,
                              descriptionColor: .white,
                              buttonTitleColor: .subText,
                              buttonBackgroundColor: .white,
                              image: image)
    }
    
}
