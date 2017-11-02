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
  
  func getUser(userId: Int, completion: @escaping (UserModel?) -> Void) {
    ApiManager.users.getUser(userId: userId) { user in
      guard let user = user else {
        completion(nil)
        return
      }
      
      let realm = try! Realm()
      try! realm.write {
        realm.add(user)
      }
      
      completion(user)
    }
  }
  
  func updateUsers(completion: @escaping (Bool) -> Void) {
    let realm = try! Realm()
    var result = true
    let userIds = Set(realm.objects(MessageModel.self).map {
      $0.receiverId
    })
    
    defer {
      completion(result)
    }
    
    setRealmFor(user: currentUser)
    for userId in userIds {
      getUser(userId: userId) {
        result = $0 != nil
      }
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
