//
//  LoginVC.swift
//  Uber
//
//  Created by AHMED SR on 1/2/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    //MARK:- Outlets
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   //MARK:- ACTION
    
    @IBAction func cancleBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
