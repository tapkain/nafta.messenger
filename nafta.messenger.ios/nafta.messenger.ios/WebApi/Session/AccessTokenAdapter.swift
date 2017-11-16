//
//  AccessTokenAdapter.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import Alamofire

class AccessTokenAdapter: RequestAdapter {
  private let accessToken: String
  
  init(accessToken: String) {
    self.accessToken = accessToken
  }
  
  func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
    var urlRequest = urlRequest
    urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
    return urlRequest
  }
}
