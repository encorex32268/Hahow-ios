//
//  CustomNavigationBar.swift
//  HaHow
//
//  Created by Samuel on 2019/9/1.
//  Copyright © 2019 ChenLiHan. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    var customHeight : CGFloat {
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        return 44 + (topPadding ?? 0)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("UIBarBackground") {
                
                subview.frame = CGRect(x: 0,
                                       y: 0,
                                       width: self.frame.width,
                                       height: customHeight)
                subview.sizeToFit()
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            
            //Can't set height of the UINavigationBarContentView
            if stringFromClass.contains("UINavigationBarContentView") {
                
                let window = UIApplication.shared.keyWindow
                let topPadding = window?.safeAreaInsets.top
                
                //Set Center Y
                let centerY = (customHeight - subview.frame.height + (topPadding ?? 0)  ) / 2.0
                subview.frame = CGRect(x: 0,
                                       y: centerY,
                                       width: self.frame.width,
                                       height: subview.frame.height)
                subview.sizeToFit()
                
            }
        }
    }

}
