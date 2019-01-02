//
//  UIViewExt.swift
//  Uber
//
//  Created by AHMED SR on 1/2/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit
extension UIView {
    func fadeTo(alphaValue:CGFloat , timeDuration:TimeInterval){
        UIView.animate(withDuration: timeDuration) {
            self.alpha = alphaValue
        }
    }
}
