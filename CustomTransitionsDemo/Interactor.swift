//
//  Interactor.swift
//  CustomTransitionsDemo
//
//  Created by Karol Altamirano on 5/24/17.
//  Copyright © 2017 Karol Altamirano. All rights reserved.
//

import UIKit

class Interactor: UIPercentDrivenInteractiveTransition {

    var hasStarted = false
    var shouldFinish = false

    override init() {
        super.init()

        // https://stackoverflow.com/questions/19626374/ios-7-custom-transition-glitch
        completionSpeed = 0.999
    }

}
