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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    mapView.delegate = self
    }

    //MARK:- Action
    @IBAction func requestRiadBtnWasPressed(_ sender: Any) {
       requestBtn.animateButton(shouldLoad: true)
    }
    
}
extension HomeVC:MKMapViewDelegate{
    
}
