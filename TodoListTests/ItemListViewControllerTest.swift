//
//  ItemListViewControllerTest.swift
//  TodoListTests
//
//  Created by user on 10.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import XCTest
@testable import TodoList

class ItemListViewControllerTest: XCTestCase {
  
  var sut: ItemListViewController!
  
  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
    sut = viewController as! ItemListViewController
    sut.loadViewIfNeeded()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_TableViewIsNotNilAfterViewDidLoad() {
    XCTAssertNotNil(sut.tableView)
  }
  
  func test_LoadingView_SetsTableViewDataSource() {
    XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
  }
  
  func test_LoadingView_SetsTableViewDelegate() {
    XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
  }
  
}
