//
//  DetailViewControllerTest.swift
//  ProgrammaticallyTests
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import XCTest
@testable import Programmatically

class DetailViewControllerTest: XCTestCase {

    var controller: DetailViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller = DetailViewController(item: list[0])
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
    
    func testInitWithText() {
        let controller = DetailViewController(item: list[1])
        XCTAssertNotNil(controller, "Controller should not be nil.")
        XCTAssertNotNil(controller.view, "Controller view should not be nil.")
    }

}

extension DetailViewControllerTest {
    var list: [ItemModel] {
        let data = Test.data(name: "challenge", extension: "json")
        return try! JSONDecoder().decode([ItemModel].self, from: data)
    }
}
