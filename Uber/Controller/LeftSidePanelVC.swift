//
//  LeftSidePlaneVC.swift
//  Uber
//
//  Created by AHMED SR on 1/1/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {
    //MARK:- Outlets
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   //MARK:- Action
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: LOGIN_VC) as? LoginVC
        present(loginVC!, animated: true, completion: nil)
    }
    
}

