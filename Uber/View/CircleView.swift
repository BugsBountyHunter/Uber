//
//  CircleView.swift
//  Uber
//
//  Created by AHMED SR on 12/9/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var borderColor:UIColor?{
        didSet{
            setupView()
        }
    }
    override func awakeFromNib() {
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
    }

}
