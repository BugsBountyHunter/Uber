//
//  GradientView.swift
//  Uber
//
//  Created by AHMED SR on 12/9/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {

    let gradient = CAGradientLayer()
    override func awakeFromNib() {
//        setupView()
        setupGradientView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
       // setupView()
        setupGradientView()
    }
    func setupView(){
        //Size
        gradient.frame = self.frame
        //Color
        gradient.colors = [UIColor.white.cgColor , UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        //Start and end point
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        //Location 0.8 = 80%
        gradient.locations  = [0.8 , 1.0]
        self.layer.addSublayer(gradient)
        
    }
    func setupGradientView() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }

}
