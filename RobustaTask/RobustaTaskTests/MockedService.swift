//
//  MockedService.swift
//  RobustaTaskTests
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation
import RobustaTask

class MockedService: NSObject, RequestProtocol {

    var error: NSError?
    func fetchRequest(_ completion: @escaping ([Any], Error?) -> Void) {
        let repoModel = RepositoryModel()
        let repoModelWithEmptyName = RepositoryModel()
        repoModel.name = "repo name"
        repoModel.owner = OwnerModel()
        repoModel.owner.ownerName = "owner name"
        let mockedData = [repoModel,repoModelWithEmptyName,repoModel,repoModel,repoModel,repoModel,repoModel,repoModel,repoModel,repoModel,repoModel]
        completion(mockedData, error)
    }

    func fetchDetailsRequest(_ url: String, completion: @escaping (OwnerModel) -> Void) {
        let ownerModel = OwnerModel()
        ownerModel.ownerName = "testName"
        completion(ownerModel)
    }
}
