//
//  ApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class ApiManager {
  static let users = UserApiManager()
  static let messages = MessageApiManager()
}

extension ApiManager {
  static let api = "https://naftamessenger.herokuapp.com/api"
}
