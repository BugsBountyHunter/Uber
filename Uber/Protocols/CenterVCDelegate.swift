//
//  CenterVCDelegate.swift
//  Uber
//
//  Created by AHMED SR on 1/1/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import Foundation
protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelVC()
    func animateLeftPanel(shouldExpand:Bool)
    
}
