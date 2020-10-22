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
        delegate.isLoading(flag: true)
        request.fetchRequest { [weak self] (model) in
            let data = model as! [RepositoryModel]
            
            self?.delegate.isLoading(flag: false)
            self?.delegate.fillUIWithData(data: data)
        }
    }
}
