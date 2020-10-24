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
    private var originalDataModel: [RepositoryModel]?
    var offset = 0
    var request: RequestProtocol?
    init(viewController: DashboardDelegate, request: RequestProtocol = RequestHandler()) {
        self.request = request
        delegate = viewController
    }

    
    func fetchDataService() {
        delegate.isLoading(flag: true)
        request?.fetchRequest { [weak self] (model) in
            self?.dataModel = model as? [RepositoryModel]
            if let sub = self?.dataModel?[0...9] {
                self?.originalDataModel = Array(sub)
            }

            self?.delegate.isLoading(flag: false)
            self?.delegate.fillUIWithData()

        }
    }

    func loadMore() {
        guard self.offset != 100 else {return}
        delegate.loadMore(flag: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let dataModel = self.dataModel?[self.offset..<(self.offset+10)] else {return}
            self.offset += 10
            self.originalDataModel?.append(contentsOf: dataModel)
            self.delegate.reloadTableView()
            self.delegate.loadMore(flag: false)
        }
    }

    func fetchNames(at index: Int) {
        if originalDataModel?[index].owner.ownerName.isEmpty ?? false {
            guard let url = originalDataModel?[index].owner.url else {return}
            request?.fetchDetailsRequest(url) { [weak self](model) in
                self?.originalDataModel?[index].owner = model
                self?.delegate.reloadRow(index: index)
            }
        }
    }

    func numberOfDataSource() -> Int {
        return originalDataModel?.count ?? 0
    }

    func repoNameAtIndex(index: Int) -> String{
        return originalDataModel?[index].name ?? ""
    }

    func OwnerNameAtIndex(index: Int) -> String{

        if let ownerName = originalDataModel?[index].owner.ownerName {
            return ownerName
        }
        return "Unkown"
    }

    func imageURLAtIndex(index: Int) -> String{
        return originalDataModel?[index].owner.avatarImageURL ?? ""
    }

    func goToDetaieldScreen(with Index: Int) {
        NavigationManager.navigateToDetailedScreen(data: originalDataModel?[Index])
    }
}
