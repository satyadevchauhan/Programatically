//
//  ItemModelTest.swift
//  ProgrammaticallyTests
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import XCTest
@testable import Programmatically

class ItemModelTest: XCTestCase {

    var list: [ItemModel]!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = Test.data(name: "challenge", extension: "json")
        list = try! JSONDecoder().decode([ItemModel].self, from: data)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        list = nil
    }

    func testInit() {
        XCTAssertNotNil(list, "Object not initialised.")
        XCTAssertEqual(list.count, 34, "Object not initialised.")
    }
    
    func testInitModel() {
        let model = list[0]
        XCTAssertNotNil(model.id, "Model.data is nil.")
        XCTAssertNotNil(model.kind, "Model.data is nil.")
        XCTAssertNotNil(model.type, "Model.type is nil.")
        XCTAssertNotNil(model.date, "Model.date is nil.")
        XCTAssertNotNil(model.data, "Model.data is nil.")
    }
    
    func testInitModelImage() {
        let model = list[0]
        XCTAssertEqual(model.kind, .image, "Model.type should be image.")
    }
    
    func testInitModelText() {
        let model = list[1]
        XCTAssertEqual(model.kind, .text, "Model.type should be text.")
    }
    
    func testInitModelOther() {
        let model = list[10]
        XCTAssertEqual(model.kind, .other, "Model.type should be other.")
    }

}
