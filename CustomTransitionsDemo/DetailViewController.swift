//
//  DetailViewController.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var interactor: Interactor?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let threshold: CGFloat = 0.3

        let translation = sender.translation(in: view)
        let horizontal = translation.x / view.bounds.width
        let left = max(horizontal, 0)
        let progress = min(left, 1.0)

        guard let interactor = interactor else { return }

        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true)
        case .changed:
            interactor.shouldFinish = progress > threshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }

}
