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
}

extension ApiManager {
  static let api = "https://naftamessenger.herokuapp.com/api"
  //static let api = "192.168.1.2:5000/api"
  //static let api = "http://213.109.232.146:5000/api"
}
