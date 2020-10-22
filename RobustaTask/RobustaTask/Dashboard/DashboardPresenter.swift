//
//  DashboardPresenter.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation

class DashboardPresenter {

    var delegate: DashboardDelegate
    init(viewController: DashboardDelegate) {
        delegate = viewController
    }

    let request = RequestHandler()

    func fetchDataService() {

           request.fetchRequest { [weak self] (model) in
               print("Cool")
               let data = model as! [RepositoryModel]
            self?.delegate.fillUIWithData(data: data)
           }
       }
}
