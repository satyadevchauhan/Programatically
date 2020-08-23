//
//  MainViewControllerTest.swift
//  ProgrammaticallyTests
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import XCTest
@testable import Programmatically

class MainViewControllerTest: XCTestCase {
    
    var controller: MainViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let viewModel = ListViewModelMock()
        controller = MainViewController(viewModel: viewModel)
        _ = controller?.view
        controller?.viewWillAppear(true)
        controller?.viewDidAppear(true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller = nil
    }

    func testInitViewController() {
        XCTAssertNotNil(controller, "Controller should not be nil.")
        XCTAssertNotNil(controller.view, "Controller view should not be nil.")
    }
    
    func testTable() {
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 34, "Total number of items should match.")
    }
    
    func testFilterAll() {
        controller.viewModel.filter()
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 34, "Total number of items should match.")
    }
    
    func testFilterImage() {
        controller.viewModel.filter(type: .image)
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 16, "Total number of items should match.")
    }
    
    func testFilterText() {
        controller.viewModel.filter(type: .text)
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 17, "Total number of items should match.")
    }
    
    func testFilterOther() {
        controller.viewModel.filter(type: .other)
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 1, "Total number of items should match.")
    }

}
