//
//  ChatManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/1/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import PromiseKit

class ChatManager {
  static let sharedInstance = ChatManager()
  
  func deleteAll() {
    let realm = try! Realm()
    try! realm.write {
      let allChats = realm.objects(ChatModel.self)
      realm.delete(allChats)
    }
  }
}
