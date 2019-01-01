//
//  CircleImage.swift
//  Uber
//
//  Created by AHMED SR on 12/9/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2 
        //
        self.clipsToBounds = true
    }
}
