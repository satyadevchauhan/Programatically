//
//  ListViewModelTest.swift
//  ProgrammaticallyTests
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import XCTest
@testable import Programmatically

class ListViewModelMock: ListViewModel {

    override func getList() {
        let data = Test.data(name: "challenge", extension: "json")
        let list = try! JSONDecoder().decode([ItemModel].self, from: data)
        
        alllist = list
        filter(type: filterType)
        saveList()
    }
}

class ListViewModelTest: XCTestCase {

    var viewModel: ListViewModelMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ListViewModelMock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testInit() {
        XCTAssertNotNil(viewModel, "ViewModel should not be nil.")
        XCTAssertNil(viewModel.filterType, "ViewModel.filterType should be nil.")
    }
    
    func testInitData() {
        XCTAssertNotNil(viewModel.list, "ViewModel.list should not be nil.")
        XCTAssertEqual(viewModel.list?.count, 34, "ViewModel.list?.count should match.")
    }
    
    func testFilterAll() {
        viewModel.filter()
        XCTAssertEqual(viewModel.list?.count, 34, "ViewModel.list?.count should match.")
    }
    
    func testFilterImage() {
        viewModel.filter(type: .image)
        XCTAssertEqual(viewModel.list?.count, 16, "ViewModel.list?.count should match.")
    }
    
    func testFilterText() {
        viewModel.filter(type: .text)
        XCTAssertEqual(viewModel.list?.count, 17, "ViewModel.list?.count should match.")
    }
    
    func testFilterOther() {
        viewModel.filter(type: .other)
        XCTAssertEqual(viewModel.list?.count, 1, "ViewModel.list?.count should match.")
    }

}
