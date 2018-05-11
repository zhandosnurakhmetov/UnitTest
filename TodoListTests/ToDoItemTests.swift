//
//  ToDoItemTests.swift
//  TodoListTests
//
//  Created by user on 03.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import XCTest
@testable import TodoList

class ToDoItemTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_Init_TakesTitle() {
    _ = ToDoItem(title: "Foo", itemDescription: "Bar")
  }
  
  func test_Init_WhenGivenTitle_SetsTitle() {
    let item = ToDoItem(title: "Foo")
    XCTAssertEqual(item.title, "Foo", "should set title")
  }
  
  func test_Init_WhenGivenDescription_SetsDescription() {
    let item = ToDoItem(title: "", itemDescription: "Bar")
    XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
  }
  
  func test_Init_SetsTimestamp() {
    let item = ToDoItem(title: "", timestamp: 0.0)
    XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
  }
  
  func test_Init_WhenGivenLocation_SetsLocation() {
    let location = Location(name: "Foo")
  }
  
  
  func test_Init_SetsLocation() {
    let location = Location(name: "Foo")
    let item = ToDoItem(title: "", location: location)
    XCTAssertEqual(item.location?.name, location.name, "should set location")
  }
}
