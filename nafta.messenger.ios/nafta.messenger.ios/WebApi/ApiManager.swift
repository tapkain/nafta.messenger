//
//  ApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import Alamofire

class ApiManager {
  static let users = UserApiManager()
  static let messages = MessageApiManager()
  static let account = AccountApiManager()
  static let chats = ChatApiManager()
}

extension ApiManager {
  static let api = "http://tapkain-001-site1.etempurl.com"
}
