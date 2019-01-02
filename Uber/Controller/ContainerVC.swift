//
//  ContainerVC.swift
//  Uber
//
//  Created by AHMED SR on 1/1/19.
//  Copyright © 2019 AHMED SR. All rights reserved.
//

import UIKit
import QuartzCore
//for leftslide panel state
enum SlideOutState{
    case collapsed
    case leftPanelExpanded
}
// for which vc showing
enum ShowWhichVC {
    case homeVC
    case paymentVC
    case helpVC
    case settings
}

//frist showing vc
var showVC:ShowWhichVC = .homeVC

class ContainerVC: UIViewController {
    
    var homeVC:HomeVC!
    var leftVC:LeftSidePanelVC!
    var centerController:UIViewController!
    var currentState:SlideOutState = .collapsed {
        didSet{
            let shouldShowShadow = (currentState != .collapsed) // true >> showShadow $$ false >> hide shadow 
            shouldShowShadowForCenterViewController(shouldShowShadow)
        }
    }
    // ishidden  == for status bar
    var isHidden = false
    let centerPanelExpandedOffset:CGFloat = 160
    
    var tap:UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        initCenter(screen: showVC)
    }
    
    //
    func initCenter(screen:ShowWhichVC){
        var presentingController:UIViewController
        showVC = screen
        if homeVC == nil {
            homeVC = UIStoryboard.homeVC()
            homeVC.delegate = self
        }
        presentingController = homeVC
        // Remove any ViewController from centerContrller before presenting HomeVC .
        if let con = centerController{
            con.view.removeFromSuperview()
            con.removeFromParent()
        }
        centerController = presentingController
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    //MARK:- STATUS BAR  override  function
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return UIStatusBarAnimation.slide
    }
    override var prefersStatusBarHidden: Bool{
        return isHidden
    }

}
extension ContainerVC:CenterVCDelegate{
    
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded) // true  because current state is equle = collapsed
        if notAlreadyExpanded{
            //expanded to left panel
            addLeftPanelVC()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelVC() {
        if leftVC == nil {
            leftVC = UIStoryboard.leftViewController()
            addChildSidePanleVC(leftVC)
        }
    }
    //Add child panle to parent currentVC
    func  addChildSidePanleVC(_ sidePanelController:LeftSidePanelVC){
        view.insertSubview(sidePanelController.view, at: 0)
        addChild(sidePanelController)
        sidePanelController.didMove(toParent: self)
    }
    
    @objc func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            isHidden = !isHidden // true >> status bar ==  hiddeen
            animateStatusBar()
            setupWhiteCoverView()
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: self.centerController.view.frame.width - centerPanelExpandedOffset)
        }else{
            isHidden = !isHidden  // false >> status bar == show
            animateStatusBar()
            hideWhiteCoverView()
            animateCenterPanelXPosition(targetPosition: 0) { (finished) in
                if finished {
                    self.currentState = .collapsed
                    self.leftVC  = nil
                }
            }
        }
    }
    //MARK:- Move X-Position for centerController
    func animateCenterPanelXPosition(targetPosition:CGFloat , completion:((Bool)->Void)? = nil){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    //MARK:- Animated Status
    func animateStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
    //MARK:- Add whiteCoverView to  centerController
    func setupWhiteCoverView(){
        //create whiteView
        let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
        whiteCoverView.alpha = 0.0
        whiteCoverView.backgroundColor = UIColor.white
        whiteCoverView.tag = 25
        // Add new view to centerCotroller
        self.centerController.view.addSubview(whiteCoverView)
        UIView.animate(withDuration: 0.5) {
            whiteCoverView.alpha = 0.75
        }
        // Add tap GestureRecognizer to white view
        tap = UITapGestureRecognizer(target: self, action: #selector(animateLeftPanel(shouldExpand:)))
        tap.numberOfTapsRequired = 1
        self.centerController.view.addGestureRecognizer(tap)
    }
    func hideWhiteCoverView(){
        //Remove tap from center view
        centerController.view.removeGestureRecognizer(tap)
        //Remove whiteCoverView
        for subview in self.centerController.view.subviews {
            if subview.tag == 25 {
                UIView.animate(withDuration: 0.2, animations: {
                    subview.alpha = 0.0
                }) { (finished) in
                    subview.removeFromSuperview()
                }
            }
        }
    }
    //MARK:- Add shadow for centerController
    func shouldShowShadowForCenterViewController(_ status:Bool){
        if status {
            self.centerController.view.layer.shadowOpacity = 0.6
        }else{
            self.centerController.view.layer.shadowOpacity = 0.0
        }
    }
    
}
private extension UIStoryboard{
    class func mainStoryboard()->UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    class func leftViewController()->LeftSidePanelVC?{
        return mainStoryboard().instantiateViewController(withIdentifier: LEFT_SIDE_PANEL_VC) as? LeftSidePanelVC
    }
    class func homeVC()->HomeVC?{
        return mainStoryboard().instantiateViewController(withIdentifier: HOME_VC) as? HomeVC
    }
}
