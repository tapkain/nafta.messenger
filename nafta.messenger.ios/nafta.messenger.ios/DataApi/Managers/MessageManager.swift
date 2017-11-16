//
//  MessageManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/1/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import PromiseKit

class MessageManager {
  static let sharedInstance = MessageManager()
  
  func sendMessage(chat: ChatModel, text: String) -> Promise<Void> {
    let timestamp = Date().timeIntervalSince1970
    let senderId = UserManager.sharedInstance.currentUser.id
    
    let message = MessageModel()
    message.time = timestamp
    message.userId = senderId
    message.chatId = chat.id
    message.text = text
    
    return ApiManager.messages.sendMessage(message: message).asVoid()
  }
  
  func getMessagesFor(user: UserModel) -> Results<MessageModel> {
    let realm = try! Realm()
    let messages = realm.objects(MessageModel.self).filter("self.receiverId == %@", user.id)

    return messages
  }
  
  func updateMessages() -> Promise<[MessageModel]> {
    let timestamp = Int((Calendar.current.date(byAdding: .day, value: -7, to: Date())?.timeIntervalSince1970)!)
    let q = DispatchQueue.global()
    
    return ApiManager.messages.getMessages(timestamp: timestamp).then(on: q) { messages in
      let realm = try! Realm()
      try! realm.write {
        let allMessages = realm.objects(MessageModel.self)
        realm.delete(allMessages)
        realm.add(messages)
      }
      
      return Promise(value: messages)
    }
  }
}
