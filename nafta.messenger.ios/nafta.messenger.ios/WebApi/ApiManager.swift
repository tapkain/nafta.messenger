//
//  ApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

class ApiManager {
  static let users = UserApiManager()
}

extension ApiManager {
  static let api = "https://naftamessenger.herokuapp.com/api"
}
