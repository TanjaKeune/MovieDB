//
//  MoviePresentationController.swift
//  MovieDB
//
//  Created by Tanja Keune on 9/26/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

class MoviePresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate {
    
    var dimmingView = UIView()
    
    override var shouldPresentInFullscreen: Bool {
        
        return true
    }
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        dimmingView.alpha = 0
        
    }
    
    override func presentationTransitionWillBegin() {
        
        dimmingView.frame = self.containerView!.bounds
        dimmingView.alpha = 0
        containerView?.insertSubview(dimmingView, at: 0)
        if let  coordinatior = presentedViewController.transitionCoordinator {
            coordinatior.animate(alongsideTransition: { (context:UIViewControllerTransitionCoordinatorContext) in
                self.dimmingView.alpha = 1
            }, completion: nil)
        } else {
            self.dimmingView.alpha = 1
            
        }
    }
    
    override func dismissalTransitionWillBegin() {
        
        if let coordinator = presentedViewController.transitionCoordinator {
            
            coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext) in
                self.dimmingView.alpha = 0
            }, completion: nil)
        } else {
            dimmingView.alpha = 0
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        if let containerBounds = containerView?.bounds {
            dimmingView.frame = containerBounds
            presentedView?.frame = containerBounds
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .overFullScreen
    }
}


