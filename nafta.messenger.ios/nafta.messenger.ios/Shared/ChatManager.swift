//
//  ChatManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/1/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class ChatManager {
  static let sharedInstance = ChatManager()
  
  func updateChats(completion: @escaping (Bool) -> Void) {
    var result = true
    let realm = try! Realm()
    let allChats = realm.objects(ChatModel.self)
    
    MessageManager.sharedInstance.updateMessages {_ in
      result = false
    }
  }
}
