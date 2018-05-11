//
//  APIClient.swift
//  TodoList
//
//  Created by user on 11.05.2018.
//  Copyright © 2018 ChocoFamily. All rights reserved.
//

import Foundation

protocol SessionProtocol {
  func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol {}

class APIClient {
  lazy var session: SessionProtocol = URLSession.shared

  func loginUser(withName username: String,
                 password: String,
                 completion: @escaping (Token?, Error?) -> Void) {
    guard let url = URL(string: "https://awesometodos.com") else { fatalError() }
    session.dataTask(with: url) { (data, response, error) in
      
    }
  }
}
