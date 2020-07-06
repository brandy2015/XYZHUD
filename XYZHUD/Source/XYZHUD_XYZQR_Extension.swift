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
