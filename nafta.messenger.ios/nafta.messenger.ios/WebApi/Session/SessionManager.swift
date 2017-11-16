//
//  SessionManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import Alamofire

class SessionManager {
  static let sharedInstance = SessionManager()
  
  func setSession(token: TokenModel, remember: Bool) throws {
    Alamofire.SessionManager.default.adapter = AccessTokenAdapter(accessToken: token.accessToken)
    RealmManager.sharedInstance.setDatabase(name: token.username)
    
    if remember {
      let userDefaults = UserDefaults.standard
      let data = try PropertyListEncoder().encode(token)
      userDefaults.set(data, forKey: "accessToken")
    }
  }
  
  func restoreSession() throws -> Bool {
    let userDefaults = UserDefaults.standard
    guard let data = userDefaults.value(forKey: "accessToken") else {
      return false
    }
    
    guard let token = try? PropertyListDecoder().decode(TokenModel.self, from: data as! Data) else {
      return false
    }
    
    try! setSession(token: token, remember: false)
    return true
  }
}
