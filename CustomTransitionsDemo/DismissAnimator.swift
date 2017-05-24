//
//  DismissAnimator.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
        else { return }

        let containerView = transitionContext.containerView

        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)

        let screenBounds = UIScreen.main.bounds
        let rightTopCorner = CGPoint(x: screenBounds.width, y: 0)
        let finalFrame = CGRect(origin: rightTopCorner, size: screenBounds.size)

        containerView.layoutIfNeeded()
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromVC.view.frame = finalFrame
                containerView.layoutIfNeeded()
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                containerView.layoutIfNeeded()
            }
        )
    }
    
}
