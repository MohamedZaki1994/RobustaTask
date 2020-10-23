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
        let request = RequestHandler()
//        request.fetchDetailsRequest(repo?.owner.url ?? "") { [weak self](_) in
            self.delegate?.updateUI()
//        }
    }
}
