//
//  MessageManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/1/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class MessageManager {
  static let sharedInstance = MessageManager()
  
  func updateMessages(completion: @escaping (Bool) -> Void) {
    let timestamp = Int((Calendar.current.date(byAdding: .day, value: -7, to: Date())?.timeIntervalSince1970)!)
    var result = true
    
    ApiManager.messages.getMessages(timestamp: timestamp) { messages in
      defer {
        completion(result)
      }
      
      guard let messages = messages else {
        result = false
        return
      }
      
      let realm = try! Realm()
      try! realm.write {
        let allMessages = realm.objects(MessageModel.self)
        realm.delete(allMessages)
        realm.add(messages)
      }
    }
  }
}
