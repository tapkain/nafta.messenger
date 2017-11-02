//
//  MessageModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/31/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class MessageModel: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var senderId: Int = 0
  @objc dynamic var receiverId: Int = 0
  @objc dynamic var textContent: String = ""
  @objc dynamic var sendTimestamp: Int = 0
}

extension MessageModel {
  static func fromJson(_ json: JSON) -> MessageModel {
    let message = MessageModel()
    message.id = json["messageId"].int!
    message.senderId = json["userSenderId"].int!
    message.receiverId = json["userReceiverId"].int!
    message.textContent = json["textContent"].string!
    message.sendTimestamp = json["sendTimestamp"].int!
    
    return message
  }
}
