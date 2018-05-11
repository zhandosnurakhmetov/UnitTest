//
//  ItemCellTests.swift
//  TodoListTests
//
//  Created by user on 11.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import XCTest
@testable import TodoList

class ItemCellTests: XCTestCase {
  
  var tableView: UITableView!
  let dataSource = FakeDataSource()
  var cell: ItemCell!
  
  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
    controller.loadViewIfNeeded()
  
    tableView = controller.tableView
    tableView?.dataSource = dataSource
    cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_HasNameLabel() {
    XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
  }
  
  func test_HasLocationLabel() {
    XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
  }
  
  func test_HasDateLabel() {
    XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
  }
  
  func test_ConfigCell_SetsTitle() {
    let item = ToDoItem(title: "Foo")
    cell.configCell(with: item)
    XCTAssertEqual(cell.titleLabel.text, "Foo")
  }
  
  func test_ConfigCell_SetsLocation() {
    let location = Location(name: "Abay street")
    let item = ToDoItem(title: "Foo", location: location)
    cell.configCell(with: item)
    
    XCTAssertEqual(cell.locationLabel.text, "Abay street")
  }
  
  func test_ConfigCell_SetsDate() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
   
    let date = dateFormatter.date(from: "08/27/2017")
    let timestamp = date?.timeIntervalSince1970
    
    let item = ToDoItem(title: "Foo", timestamp: timestamp)
    cell.configCell(with: item)
    
    XCTAssertEqual(cell.dateLabel.text, "08/27/2017")
  }
  
  func test_Title_WhenItemIsChecked_IsStrokeThrough() {
    let location = Location(name: "Bar")
    let item = ToDoItem(title: "Foo", itemDescription: nil, timestamp: 1456150025, location: location)
    
    cell.configCell(with: item, checked: true)
   
    let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue])
    XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
    XCTAssertNil(cell.locationLabel.text)
    XCTAssertNil(cell.dateLabel.text)
  }
  
}

extension ItemCellTests {
  class FakeDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()
      return cell
    }
    
  }
}
