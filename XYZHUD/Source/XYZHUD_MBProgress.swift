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
import MBProgressHUD

public extension XYZHUDObject{
    
    func HUD窗口(LabelText:String,添加到的窗口:UIView,加载时间:Double = 3){
        MBpopedView.hide(animated: true)
        MBpopedView = MBProgressHUD.showAdded(to: 添加到的窗口, animated: true)
        MBpopedView.label.text = LabelText
        MBpopedView.hide(animated: true, afterDelay: 加载时间)
    }
    func HudBadNetwork(title:String = "网络不好",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }

    func HudonLoading(title:String = "正在加载ing",on ViewX:UIView)  {
        HUD窗口(LabelText: title, 添加到的窗口: ViewX)
    }

    //和Hide一样
    func dismissMBpopedView() {
        MBpopedView.hide(animated: true)
    }
}
