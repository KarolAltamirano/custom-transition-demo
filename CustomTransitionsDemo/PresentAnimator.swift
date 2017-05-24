//
//  PresentAnimator.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
        else { return }

        let containerView = transitionContext.containerView

        let screenBounds = UIScreen.main.bounds
        let rightTopCorner = CGPoint(x: screenBounds.width, y: 0)
        let startFrame = CGRect(origin: rightTopCorner, size: screenBounds.size)
        let finalFrame = CGRect(origin: CGPoint.zero, size: screenBounds.size)

        toVC.view.frame = startFrame
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)

        containerView.layoutIfNeeded()
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                toVC.view.frame = finalFrame
                containerView.layoutIfNeeded()
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                containerView.layoutIfNeeded()
            }
        )
    }
    
}
