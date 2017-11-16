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
  private var token: TokenModel! = nil
  
  func setSession(token: TokenModel, remember: Bool) throws {
    self.token = token
    Alamofire.SessionManager.default.adapter = AccessTokenAdapter(accessToken: token.accessToken)
    RealmManager.sharedInstance.setDatabase(name: token.username)
    
    if remember {
      let userDefaults = UserDefaults.standard
      let data = try PropertyListEncoder().encode(token)
      userDefaults.set(data, forKey: "accessToken")
    }
  }
  
  func logout() {
    Alamofire.SessionManager.default.adapter = nil
    RealmManager.sharedInstance.removeDatabase(name: token.username)
    token = nil
    
    let userDefaults = UserDefaults.standard
    userDefaults.removeObject(forKey: "accessToken")
  }
  
  func restoreSession() -> Bool {
    let userDefaults = UserDefaults.standard
    guard let data = userDefaults.value(forKey: "accessToken") as? Data else {
      return false
    }
    
    guard let token = try? PropertyListDecoder().decode(TokenModel.self, from: data) else {
      return false
    }
    
    do {
      try setSession(token: token, remember: false)
    } catch {
      return false
    }
    
    self.token = token
    return true
  }
}
