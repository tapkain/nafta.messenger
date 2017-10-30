//
//  UserManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class UserManager {
  static let sharedInstance = UserManager()
  var currentUser: UserModel! = nil
  
  func login(username: String, password: String, completion: @escaping (UserModel?) -> Void) {
    ApiManager.users.login(username: username, password: password) { user in
      guard let user = user else {
        completion(nil)
        return
      }
      
      self.setRealmFor(user: user)
      completion(user)
    }
  }
  
  func signup(username: String, password: String, completion: @escaping (UserModel?) -> Void) {
    ApiManager.users.signup(username: username, password: password) { user in
      guard let user = user else {
        completion(nil)
        return
      }
      
      self.setRealmFor(user: user)
      completion(user)
    }
  }
  
  func setRealmFor(user: UserModel) {
    currentUser = user
    let url = URL(string: "\((Bundle.main.resourceURL?.absoluteString)!)\(user.username).realm")
    
    var config = Realm.Configuration()
    config.fileURL = url
    Realm.Configuration.defaultConfiguration = config
    
    let realm = try! Realm()
    try! realm.write {
      realm.add(user)
    }
  }
}
