//
//  DashboardPresenterTests.swift
//  RobustaTaskTests
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import XCTest
@testable import RobustaTask
class DashboardPresenterTests: XCTestCase {
    var sut: DashboardPresenter!
    var mockedDashboardViewController: MockedDashboardViewController!
    var mockedService: MockedService!
    override func setUp() {
        super.setUp()
        mockedDashboardViewController = MockedDashboardViewController()
        mockedService = MockedService()
        sut = DashboardPresenter(viewController: mockedDashboardViewController, request: mockedService)
    }

    override func tearDown() {
        sut = nil
        mockedDashboardViewController = nil
        mockedService = nil
    }

    func testFillUICalledAfterFetchingDataService() {
        mockedDashboardViewController.fillUICalled = false
        sut.fetchDataService()
        XCTAssertTrue(mockedDashboardViewController.fillUICalled)
    }

    func testReloadRowAfterFetchingName() {
        mockedDashboardViewController.reloadRowCalled = false
        sut.fetchDataService()
        sut.fetchNames(at: 1)
        XCTAssertTrue(mockedDashboardViewController.reloadRowCalled)
    }

    func testLoadMoreCallReloadTableView() {
        let exp = expectation(description: "")
        sut.fetchDataService()
        sut.loadMore()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
        XCTAssertTrue(mockedDashboardViewController.reloadTableViewCalled)
    }

    func testFetchingRepoName() {
        sut.fetchDataService()
        let repoName =  sut.repoNameAtIndex(index: 0)
        XCTAssertEqual(repoName, "repo name")
    }

    func testOwnerName() {
        sut.fetchDataService()
        let ownerName = sut.ownerNameAtIndex(index: 0)
        XCTAssertEqual(ownerName, "owner name")
    }

    func testShowErrorCalledIfErrorfromService() {
        mockedDashboardViewController.isErrorCalled = false
        mockedService.error = NSError(domain: "", code: 400, userInfo: nil)
        sut.fetchDataService()
        XCTAssertTrue(mockedDashboardViewController.isErrorCalled)
    }
}
