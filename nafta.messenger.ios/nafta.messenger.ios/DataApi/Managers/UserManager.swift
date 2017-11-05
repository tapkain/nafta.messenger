//
//  UserManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import PromiseKit

class UserManager {
  static let sharedInstance = UserManager()
  var currentUser: UserModel! = nil
  
  func login(username: String, password: String) -> Promise<Void> {
    return ApiManager.users.login(username: username, password: password).then { user in
      self.setRealmFor(user: user)
    }
  }
  
  func signup(username: String, password: String) -> Promise<Void> {
    return ApiManager.users.signup(username: username, password: password).then { user in
      self.setRealmFor(user: user)
    }
  }
  
  func getUser(userId: Int) -> Promise<UserModel> {
    return ApiManager.users.getUser(userId: userId).then { user in
      let realm = try! Realm()
      try! realm.write {
        realm.add(user)
      }
      return Promise(value: user)
    }
  }
  
  func getUser(username: String) -> Promise<UserModel> {
    return ApiManager.users.getUser(username: username).then { user in
      let realm = try! Realm()
      try! realm.write {
        realm.add(user)
      }
      return Promise(value: user)
    }
  }
  
  func setRealmFor(user: UserModel) {
    currentUser = user
    let url = URL(string: "\((Bundle.main.resourceURL?.absoluteString)!)\(user.username).realm")
    
    var config = Realm.Configuration()
    config.fileURL = url
    Realm.Configuration.defaultConfiguration = config
    
    let realm = try! Realm()
    let allUsers = realm.objects(UserModel.self)
    
    try! realm.write {
      realm.delete(allUsers)
      realm.add(user)
    }
  }
}
