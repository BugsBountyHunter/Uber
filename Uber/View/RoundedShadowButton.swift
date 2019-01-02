//
//  RoundedShadowButton.swift
//  Uber
//
//  Created by AHMED SR on 1/1/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedShadowButton: UIButton {
  
    var originalSize:CGRect?
    override func awakeFromNib() {
//        super.awakeFromNib()
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        originalSize = self.frame
        self.layer.cornerRadius = 5.0
        
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        
    }
    
    //MARK:- Function to animate load button
    
    func animateButton(shouldLoad:Bool , message:String? = ""){
        //Add spinner
        let spinner = UIActivityIndicatorView()
        spinner.style = .whiteLarge
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        spinner.tag = 21
        
        if shouldLoad {
            //Animate button
            self.addSubview(spinner)
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                // make button like circle
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX  - (self.frame.height / 2 ), y: self.frame.origin.y , width: self.frame.height, height: self.frame.height)
            }) { [weak self](finished) in
                guard let self = self else{return}
                if finished == true {
                    spinner.startAnimating()
                    spinner.center = CGPoint(x: (self.frame.width / 2) + 1, y: self.frame.width / 2 + 1 )
//                   // spinner.fadeTo(alphaValue: 1.0, withDuration: 0.2)
//                    UIView.animate(withDuration: 0.1, animations: {
//                        spinner.alpha = 1.0
//                    })
                   self.fadeTo(alphaValue: 1.0, timeDuration: 0.2)
                }
            }
            self.isUserInteractionEnabled = false
        }else{
            //stop animate
            self.isUserInteractionEnabled = true
            
            for subview in self.subviews{
                if subview.tag == 21 {
                    subview.removeFromSuperview()
                }
            }
            UIView.animate(withDuration: 0.2) {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
                self.setTitle(message, for: .normal)
                
            }
        }
        
        
        
        
        
    }

}
