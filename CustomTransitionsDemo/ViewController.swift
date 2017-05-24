//
//  ViewController.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transition = ModalTransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.transitioningDelegate = transition
            destination.interactor = transition.interactor
        }
    }

}
