//
//  XYZHUD.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/2/10.
//  Copyright © 2019 张子豪. All rights reserved.
//
//DispatchQueue.main.sync {
import UIKit
import SoHow
import Async
import Localize_Swift
import XYZColor

public var XYZHUD = XYZHUDObject()
public class XYZHUDObject: NSObject {

    public var popedView = CustomPopupViewController()
    @discardableResult
    public func 弹出popUPView(标题:String = "成功",描述:String = "成功了",颜色:UIColor = UIColor(red: 73/255, green: 210/255, blue: 67/255, alpha:0.5)) -> CustomPopupViewController {
        dismiss()
        let rootViewController = CustomPopupViewController()
        rootViewController.显示时长 = 100
        rootViewController.isTop = true
        rootViewController.titleString = 标题
        rootViewController.descriptionString = 描述
        rootViewController.CustomPopupViewbackgroundColor = 颜色
        Async.userInitiated {}.main {
             PopupWindowManager.shared.changeKeyWindow(rootViewController: rootViewController)
        }
        popedView = rootViewController
        return rootViewController
    }
    
    public func dismiss() {
        popedView.dismiss(animated: true, completion: nil)
    }
    public func GIFTranfering()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在将GIF转换为Video".localized(), 颜色: UIColor.Converting)
    }
    
    public func Succeed()  {

        弹出popUPView(标题: "成功了".localized(), 描述: "已经转换成功".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func Waiting()  {
    
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换".localized(), 颜色: UIColor.Converting)
    }
    
    public func Failed()  {
        print("出错了")

          弹出popUPView(标题: "请稍等".localized(), 描述: "出错了".localized(), 颜色: UIColor.Failed)
    }
    
    
    
    public func pop正在转换成LMR请稍等()  {
          弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换成LMR，保存在本软件中".localized(), 颜色: UIColor.Converting)
    }
    
    public func pop用于分享请稍等()  {
           弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备数据用于分享".localized(), 颜色: UIColor.Converting)
    }
    public func pop您没有选照片()  {
           弹出popUPView(标题: "您没有选照片".localized(), 描述: "重新选".localized(), 颜色: UIColor.Failed)
    }
    
    public func pop成功了()  {
          弹出popUPView(标题: "成功了".localized(), 描述: "去相册看看吧☺".localized(), 颜色: UIColor.Succeeded)
        
    }
    
    public func pop失败了权限的原因无法保存()  {
          弹出popUPView(标题: "失败了".localized(), 描述: "很有可能因为权限的原因无法保存".localized(), 颜色: UIColor.Failed)
    }
    
    public func pop请稍等正在转换()  {
          弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换".localized(), 颜色: UIColor.Converting)
        
    }
    
    
    public func 请稍等正在还原()  {
        弹出popUPView(标题: "稍等正在还原".localized(), 描述: "马上就好".localized(), 颜色: UIColor.GIFSize)
    }
    public func 打开失败(描述: String) {
        弹出popUPView(标题: "打开失败".localized(), 描述: 描述, 颜色: UIColor.Failed)
    }
    
    
    public func 反馈成功View() {
        弹出popUPView(标题: "反馈成功".localized(), 描述: "我会尽快回复您的邮件，您的反馈对软件的改进很重要".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func 正在准备视频用于分享() {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备视频用于分享".localized(), 颜色: UIColor.Converting)
    }
    
    
    public func 去相册看看转换好的视频吧()  {
        弹出popUPView(标题: "成功了".localized(), 描述: "去相册看看转换好的视频吧☺".localized(), 颜色: UIColor.Succeeded)
    }
    
    public func 准备GIF数据用于分享()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在准备GIF数据用于分享".localized(), 颜色: UIColor.Converting)
    }
    
    public func GIF成功()  {
        弹出popUPView(标题: "成功了".localized(), 描述: "您可以通过⚙自定义GIF表情的速度、帧数、大小".localized(), 颜色: UIColor.Succeeded)
    }
    
    
    public func 视频大小决定处理时间长度()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换,视频大小决定处理时间长度".localized(), 颜色: UIColor.Converting)
    }
    
    public func 正在转换成LMR用于分享()  {
        弹出popUPView(标题: "请稍等".localized(), 描述: "正在转换成LMR用于分享".localized(), 颜色: UIColor.Converting)
    }
    
}
