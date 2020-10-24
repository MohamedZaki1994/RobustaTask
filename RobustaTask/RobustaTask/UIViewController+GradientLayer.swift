//
//  UIViewController+GradientLayer.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func setupGradientLayer() {
        let grad = CAGradientLayer()
        grad.colors = [UIColor.red.cgColor,UIColor.orange.cgColor]
        grad.locations = [0.0 , 1.0]
        grad.startPoint = CGPoint(x: 0.0, y: 1.0)
        grad.endPoint = CGPoint(x: 1.0, y: 1.0)
        grad.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.layer.insertSublayer(grad, at: 0)
    }
}
