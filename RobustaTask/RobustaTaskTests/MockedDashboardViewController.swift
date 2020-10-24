//
//  MockedDashboardViewController.swift
//  RobustaTaskTests
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import Foundation
@testable import RobustaTask
class MockedDashboardViewController: DashboardDelegate {
    var isLoading: Bool?
    var fillUICalled = false
    var reloadRowCalled = false
    var loadMoreCalled = false
    var reloadTableViewCalled = false
    func isLoading(flag: Bool) {
        isLoading = flag ? true : false
    }

    func fillUI() {
        fillUICalled = true
    }

    func reloadRow(index: Int) {
        reloadRowCalled = true
    }

    func loadMore(flag: Bool) {
        loadMoreCalled = true
    }

    func reloadTableView() {
        reloadTableViewCalled = true
    }

}
