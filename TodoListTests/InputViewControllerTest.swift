//
//  InputViewControllerTest.swift
//  TodoListTests
//
//  Created by user on 11.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TodoList

class InputViewControllerTest: XCTestCase {
  
  var sut: InputViewController!
  var placemark: MockPlacemark!
  
  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
    sut.loadViewIfNeeded()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_HasTitleTextField() {
    let titleTextFieldIsSubView = sut.titleTextField?.isDescendant(of: sut.view) ?? false
    XCTAssertTrue(titleTextFieldIsSubView)
  }
  
  func test_HasDateTextField() {
    let dateTextFieldSubView = sut.dateTextField.isDescendant(of: sut.view)
    XCTAssertTrue(dateTextFieldSubView)
  }
  
//  func test_SaveButtonHasSaveAction() {
//    let saveButton: UIButton = sut.saveButton
//    guard let actions = saveButton.actions(
//      forTarget: sut,
//      forControlEvent: .touchUpInside) else {
//        XCTFail(); return
//    }
//    XCTAssertTrue(actions.contains("save"))
//  }

  
  
//  func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/yyyy"
//
//    let timestamp = 1456095600.0
//    let date = Date(timeIntervalSince1970: timestamp)
//
//    sut.titleTextField.text = "Foo"
//    sut.dateTextField.text = dateFormatter.string(from: date)
//    sut.locationTextField.text = "Bar"
//    sut.addressTextField.text = "Infinite Loop 1, Cupertino"
//    sut.descriptionTextField.text = "Baz"
//
//    let mockGeocoder = MockGeocoder()
//    sut.geocoder = mockGeocoder
//    sut.itemManager = ItemManager()
//    sut.save()
//    placemark = MockPlacemark()
//    let coordinate = CLLocationCoordinate2DMake(37.3316851,
//                                                -122.0300674)
//    mockGeocoder.completionHandler?([placemark], nil)
//    let item = sut.itemManager?.item(at: 0)
//    let testItem = ToDoItem(title: "Foo",
//                            itemDescription: "Baz",
//                            timestamp: timestamp,
//                            location: Location(name: "Bar",
//                                               coordinate: coordinate))
//    XCTAssertEqual(item, testItem)
//  }
  
  func test_Geocoder_FetchesCoordinates() {
    let geocoderAnswered = expectation(description: "Geocoder")
    let address = "Infinite Loop 1, Cupertino"
    CLGeocoder().geocodeAddressString(address) { (placemarks, error) -> Void in
        let coordinate = placemarks?.first?.location?.coordinate
        guard let latitude = coordinate?.latitude else {
            XCTFail()
            return
      }
      
      guard let longitude = coordinate?.longitude else {
        XCTFail()
        return
      }
      
      XCTAssertEqual(latitude, 37.3316, accuracy: 0.001)
      XCTAssertEqual(longitude, -122.0300, accuracy: 0.001)
      geocoderAnswered.fulfill()
    }
    waitForExpectations(timeout: 3, handler: nil)
  }
  
}

extension InputViewControllerTest {
  class MockGeocoder: CLGeocoder {
    var completionHandler: CLGeocodeCompletionHandler?
    
    override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
      self.completionHandler = completionHandler
    }
  }
  
  class MockPlacemark : CLPlacemark {
    var mockCoordinate: CLLocationCoordinate2D?
    override var location: CLLocation? {
      guard let coordinate = mockCoordinate else
      { return CLLocation() }
      return CLLocation(latitude: coordinate.latitude,
                        longitude: coordinate.longitude)
    }
  }
  
}
