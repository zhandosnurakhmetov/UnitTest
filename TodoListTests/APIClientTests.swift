//
//  APIClientTests.swift
//  TodoListTests
//
//  Created by user on 11.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import XCTest
@testable import TodoList

class APIClientTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_Login_UsesExpectedHost() {
    let sut = APIClient()
    let mockURLSession = MockURLSession()
    sut.session = mockURLSession
    
    let completion = { (token: Token?, error: Error?) in }
    sut.loginUser(withName:"dasdom", password: "1234", completion: completion)
    
    guard let url = mockURLSession.url else {
      XCTFail()
      return
    }
    let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
    XCTAssertEqual(urlComponents?.host, "awesometodos.com")
  }
}

extension APIClientTests {
  class MockURLSession: SessionProtocol {
    var url: URL?
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
      self.url = url
      return URLSession.shared.dataTask(with: url)
    }
  }
}
