//
//  ModalTransitionDelegate.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class ModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    let interactor = Interactor()

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }

}
