//
//  DetailedPresenterTests.swift
//  RobustaTaskTests
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import XCTest
@testable import RobustaTask

class DetailedPresenterTests: XCTestCase {

    var sut: DetailedPresenter!
    override func setUp() {
        super.setUp()
        sut = DetailedPresenter()
        let repoModel = RepositoryModel()
        repoModel.name = "repo name"
        repoModel.owner = OwnerModel()
        repoModel.owner.ownerName = "owner name"
        repoModel.owner.location = "test location"
        repoModel.owner.numberOfRepos = "2"
        repoModel.owner.followers = "3"
        repoModel.owner.following = "1"
        sut.repo = repoModel
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testOwnerName() {
         XCTAssertEqual(sut.onwerName(), "owner name")
    }
    func testRepoName() {
        XCTAssertEqual(sut.repoName(), "repo name")
    }

    func testLocation() {
         XCTAssertEqual(sut.getCity(), "test location")
     }

    func testNumberOfRepos() {
            XCTAssertEqual(sut.getNumberOfPublicRepos(), "2")
        }

    func testNumberOfFollowers() {
            XCTAssertEqual(sut.getNumberOfFollowers(), "3")
        }

    func testNumberOfFollowing() {
            XCTAssertEqual(sut.getNumberOfFollowing(), "1")
        }
}
