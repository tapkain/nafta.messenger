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
}
