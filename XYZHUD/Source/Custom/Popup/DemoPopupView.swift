//
//  DemoPopupView.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
//import PopupWindow

class DemoPopupView: UIView, PopupViewContainable, Nibable {

    enum Const {static let height: CGFloat = 100}
    
    @IBOutlet weak var containerView: UIView! {
        didSet {containerView.layer.masksToBounds = true}
    }
    
    func ImageInBundle(WithName named:String) -> UIImage {
        let bundlePath = Bundle(for: self.classForCoder).bundlePath + "/XYZHUDPic.bundle"
        let bundleXX = Bundle(path: bundlePath)!
        return UIImage(named: named, in: bundleXX, compatibleWith: nil)!
    }
    
    

        
        
        
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.imageView?.tintColor = .white
            let closeBTN = ImageInBundle(WithName: "closeBTN")
            closeButton.setImage(closeBTN, for: .normal)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var closeButtonTapHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        addDropShadow(type: .dynamic, color: .black, opacity: 0.2, radius: 3, shadowOffset: CGSize(width: 0, height: 5))
    }

    func configureDemoPopupView(popupItem: PopupItem) {
//        backgroundColor = ViewBackgroundColor
        
//            UIColor(red: 0.1, green: 1, blue: 0, alpha: 1)
//            UIColor.lightGray
        
//            UIColor(red: 238/255, green: 64/255, blue: 86/255, alpha:1)
//            UIColor.black
//            UIColor.rgba(r: 250, g: 83, b: 122, alpha: 1.0)
//            popupItem.direction == .top ? UIColor.rgba(r: 250, g: 83, b: 122, alpha: 1.0) : UIColor.rgba(r: 78, g: 154, b: 250, alpha: 1.0)
//        titleLabel.text = titleLabelString
//            popupItem.direction == .top ? "TOP" : "BOTTOM"
//        descriptionLabel.text = descriptionString
//        "It disappears after 3 seconds. Or you can erase it with the close button"
    }

    @IBAction func didTapCloseButton() {
        closeButtonTapHandler?()
    }
}
