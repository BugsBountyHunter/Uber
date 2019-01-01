//
//  RoundedView.swift
//  Uber
//
//  Created by AHMED SR on 12/9/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedView: UIView {

    override func awakeFromNib() {
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = 10.0
        //
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }

}
