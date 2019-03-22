//
//  BasePopupViewController.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2018/02/08.
//  Copyright © 2018年 shin884. All rights reserved.
//

import UIKit

open class BasePopupViewController: UIViewController {

     public var item: PopupItem?
     public var isShowedPopupView: Bool = false

     public var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return .zero
        }
    }

    override open func loadView() {
        super.loadView()
        configurePopupContainerView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange(notification:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let item = item else { return }
        if isShowedPopupView { return }
        isShowedPopupView = true
        makePopupView(with: item)
        showPopupView(duration: item.duration, curve: .easeInOut, delayFactor: 0.0)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc  public func orientationDidChange(notification: NSNotification) {
        guard let item = item else { return }
        item.view.frame = updatePopupViewFrame(with: item)
        convertShape(with: item)
    }

     public func configurePopupContainerView() {
        view = PopupContainerView()
        view.backgroundColor = .clear
    }
    public func configurePopupItem(_ popupItem: PopupItem) {
        if isShowedPopupView { return }
        item = popupItem
    }

    public func makePopupView(with popupItem: PopupItem) {
        let viewWidth = view.frame.width - popupItem.margin * 2
        let x = viewWidth > popupItem.maxWidth ? (view.frame.width - popupItem.maxWidth) / 2 : view.frame.origin.x + popupItem.margin
        let width = viewWidth > popupItem.maxWidth ? popupItem.maxWidth : viewWidth
        let height = calcHeight(with: popupItem)

        switch popupItem.direction {
        case .top:
            popupItem.view.frame = CGRect(x: x, y: -popupItem.height, width: width, height: height)
        case .bottom:
            popupItem.view.frame = CGRect(x: x , y: view.frame.height - safeAreaInsets.bottom, width: width, height: height)
        }

        item = popupItem
        convertShape(with: popupItem)
        view.addSubview(popupItem.view)
    }

    public func replacePopupView(with popupItem: PopupItem) {
        guard let item = item else { return }
        item.view.removeFromSuperview()
        popupItem.view.frame = updatePopupViewFrame(with: popupItem)
        (popupItem.view as? PopupViewContainable)?.containerView.alpha = 0.0
        view.addSubview(popupItem.view)

        self.item = popupItem
        addBlur(with: popupItem)
        convertShape(with: popupItem)

        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear)
        animator.addAnimations() {
            (popupItem.view as? PopupViewContainable)?.containerView.alpha = 1.0
        }
        animator.startAnimation()
    }

    public func showPopupView(duration: TimeInterval, curve: UIView.AnimationCurve, delayFactor: CGFloat) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            item.view.frame = me.updatePopupViewFrame(with: item)
        }, delayFactor: delayFactor)
        animator.startAnimation()

        let backgroundAnimator = UIViewPropertyAnimator(duration: duration, curve: curve)
        backgroundAnimator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            me.addBlur(with: item)
        }, delayFactor: delayFactor)
        backgroundAnimator.startAnimation()
    }

    public func transformPopupView(duration: TimeInterval, curve: UIView.AnimationCurve, popupItem: PopupItem, completion: @escaping ((UIViewAnimatingPosition) -> Void)) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations() { [weak self] in
            guard let me = self, let item = me.item else { return }
            me.addBlur(with: popupItem)
            item.view.frame = me.updatePopupViewFrame(with: popupItem)
            (item.view as? PopupViewContainable)?.containerView.alpha = 0
        }
        animator.addCompletion() { position in
            completion(position)
        }
        animator.startAnimation()
    }

    public func dismissPopupView(duration: TimeInterval, curve: UIView.AnimationCurve, delayFactor: CGFloat = 0.0, direction: PopupViewDirection, completion: @escaping ((UIViewAnimatingPosition) -> Void)) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            me.view.backgroundColor = .clear
            switch direction {
            case .top: item.view.frame.origin.y = -item.view.frame.height
            case .bottom: item.view.frame.origin.y = me.view.bounds.height
            }
        }, delayFactor: delayFactor)
        
        animator.addCompletion() { position in
            PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            completion(position)
        }
        animator.startAnimation()
    }

     public func updatePopupViewFrame(with popupItem: PopupItem) -> CGRect {
        let viewWidth = view.frame.width - popupItem.margin * 2
        let x = viewWidth > popupItem.maxWidth ? (view.frame.width - popupItem.maxWidth) / 2 : view.frame.origin.x + popupItem.margin
        let y = calcPositionY(with: popupItem)
        let width = viewWidth > popupItem.maxWidth ? popupItem.maxWidth : viewWidth
        let height = calcHeight(with: popupItem)

        switch popupItem.direction {
        case .top: return CGRect(x: x, y: y, width: width, height: height)
        case .bottom: return CGRect(x: x, y: y, width: width, height: height)
        }
    }

     public func calcHeight(with popupItem: PopupItem) -> CGFloat {
        switch (popupItem.viewType, popupItem.direction) {
        case (.toast, .top): return popupItem.height + safeAreaInsets.top
        case (.toast, .bottom): return popupItem.height + safeAreaInsets.bottom
        default: return popupItem.height
        }
    }
     public func calcPositionY(with popupItem: PopupItem) -> CGFloat {
        switch (popupItem.viewType, popupItem.direction) {
        case (.toast, .top): return view.frame.origin.y
        case (.toast, .bottom): return view.frame.height - popupItem.height - safeAreaInsets.bottom
        case (.card, .top): return popupItem.margin + view.frame.origin.y + safeAreaInsets.top
        case (.card, .bottom): return view.frame.height - popupItem.height - popupItem.margin - safeAreaInsets.bottom
        }
    }

     public func convertShape(with popupItem: PopupItem) {
        popupItem.view.convertShape(shape: popupItem.shapeType)
    }

     public func addBlur(with popupItem: PopupItem) {
        if popupItem.hasBlur {
            view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            (view as? PopupContainerView)?.isAbleToTouchLower = false
        } else {
            view.backgroundColor = UIColor.clear
            (view as? PopupContainerView)?.isAbleToTouchLower = true
        }
    }
}
