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
    private var dataModel: [RepositoryModel]?
    init(viewController: DashboardDelegate) {
        delegate = viewController
    }
    
    let request = RequestHandler()
    
    func fetchDataService() {
        delegate.isLoading(flag: true)
        request.fetchRequest { [weak self] (model) in
            self?.dataModel = model as? [RepositoryModel]
            self?.delegate.isLoading(flag: false)
            self?.delegate.fillUIWithData()
        }
    }

    func numberOfDataSource() -> Int {
        return dataModel?.count ?? 0
    }

    func repoNameAtIndex(index: Int) -> String{
        return dataModel?[index].name ?? ""
    }

    func OwnerNameAtIndex(index: Int) -> String{
        return dataModel?[index].owner.onwerName ?? ""
    }

    func imageURLAtIndex(index: Int) -> String{
        return dataModel?[index].owner.avatarImageURL ?? ""
    }

    func goToDetaieldScreen(with Index: Int) {
        NavigationManager.navigateToDetailedScreen(data: dataModel?[Index])
    }
}
