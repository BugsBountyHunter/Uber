//
//  ViewController.swift
//  Uber
//
//  Created by AHMED SR on 12/8/18.
//  Copyright © 2018 AHMED SR. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController {
    //MARK:- outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var requestBtn: RoundedShadowButton!
    @IBOutlet weak var currentLocationBtn: UIButton!
    @IBOutlet weak var profileImge: CircleImage!
    
    //MARK:- Properties
    var delegate:CenterVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    mapView.delegate = self
    }

    //MARK:- Action
    @IBAction func requestRiadBtnWasPressed(_ sender: Any) {
       requestBtn.animateButton(shouldLoad: true)
    }
    @IBAction func leftMenuBtnWasPressed(_ sender: Any) {
//        delegate?.animateLeftPanel(shouldExpand: true)
        delegate?.toggleLeftPanel()
        
    }
    
}
extension HomeVC:MKMapViewDelegate{
    
}
