//
//  DetailedPresenter.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/23/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation

class DetailedPresenter {

    var delegate: DetailedDelegate?
    var repo: RepositoryModel?

    func repoDetails() {

    }

    func fetchData() {
        self.delegate?.updateUI()
    }


    func repoName() -> String {
        return repo?.name ?? ""
    }
    func onwerName() -> String {
        return repo?.owner.ownerName ?? ""
    }

    func getCity() -> String{
        return repo?.owner.location ?? ""
    }

    func getNumberOfFollowers() -> String {
        return repo?.owner.followers ?? ""
    }

    func getNumberOfFollowing() -> String {
        return repo?.owner.following ?? ""
    }

    func getNumberOfPublicRepos() -> String {
        return repo?.owner.numberOfRepos ?? ""
    }
}
