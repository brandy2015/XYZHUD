//
//  XYZHUD_MBProgress.swift
//  XYZHUD
//
//  Created by 张子豪 on 2019/8/2.
//  Copyright © 2019 张子豪. All rights reserved.
//

//import UIKit

class XYZHUD_MBProgress: NSObject {

}
import UIKit

public extension XYZHUDObject{
    
    func HUD窗口(LabelText:String,添加到的窗口:UIView,加载时间:Double = 3){
        DispatchQueue.main.async {
            var attributes = PresetsDataSource()[4, 0].attributes
            attributes.displayMode = .inferred
            attributes.position = .top
            attributes.displayDuration = EKAttributes.DisplayDuration(exactly: 加载时间) ?? .infinity

            let style = EKProperty.LabelStyle(
                font: MainFont.light.with(size: 14),
                color: .white,
                alignment: .center
            )
            let label = EKProperty.LabelContent(text: LabelText, style: style)
            let contentView = EKNoteMessageView(with: label)
            SwiftEntryKit.display(entry: contentView, using: attributes)
        }
    }
    func HudBadNetwork(title:String = "网络不好",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }

    func HudonLoading(title:String = "正在加载ing",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }

    //和Hide一样
    func dismissMBpopedView() {
        DispatchQueue.main.async {
            SwiftEntryKit.dismiss()
        }
    }
}
