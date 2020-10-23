//
//  NavigationManager.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/23/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager {

    static func navigateToDetailedScreen(data: RepositoryModel?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailedVC = storyboard.instantiateViewController(identifier: "DetailedViewController") as? DetailedViewController else {return}
        detailedVC.presenter = DetailedPresenter()
        detailedVC.presenter?.repo = data
        let topViewController = getTopMostVC()
        (topViewController as? UINavigationController)?.pushViewController(detailedVC, animated: true)
    }

    static private func getTopMostVC() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
