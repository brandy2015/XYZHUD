//
//  UIApplication_Extension.swift
//  XYZHUD
//
//  Created by zhangzihao on 2021/8/21.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit

//MARK:扩展UIApplication    </>
extension UIApplication {
//    var statusBarStyle :UIStatusBarStyle?{
//        let keyWindow = UIApplication.shared.connectedScenes
//            .map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.first
//        return keyWindow?.windowScene?.statusBarManager?.statusBarStyle
//    }
    
    
    var statusBarUIView: UIView?{
         
        let tag = 3848245
        let keyWindow = UIApplication.shared.connectedScenes
            .map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.first
        
        if let statusBar = keyWindow?.viewWithTag(tag){
            return statusBar
            
        }else{
            
            
            let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
            let statusBarView = UIView(frame: height)
            statusBarView.tag = tag
            
            statusBarView.layer.zPosition=999999
            keyWindow?.addSubview(statusBarView)
            
            return statusBarView

        }
    }
}
