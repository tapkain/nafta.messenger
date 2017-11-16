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
  @objc dynamic var id = 0
  @objc dynamic var text = ""
  @objc dynamic var userId = 0
  @objc dynamic var chatId = 0
  @objc dynamic var time: Double = 0
}

extension MessageModel {
  static func fromJson(_ json: JSON) -> MessageModel {
    let message = MessageModel()
    message.id = json["id"].int!
    message.text = json["text"].string!
    message.userId = json["userId"].int!
    message.chatId = json["chatId"].int!
    
    let jsonDate = json["time"].string!
    let date = Formatter.dateFormatter.date(from: jsonDate)
    let timestamp = date?.timeIntervalSince1970
    message.time = timestamp!
    
    return message
  }
  
  func toJson() -> [String: Any] {
    var json = [String: Any]()
    json["id"] = self.id
    json["text"] = self.text
    json["userId"] = self.userId
    json["chatId"] = self.chatId
    
    let date = Date(timeIntervalSince1970: self.time)
    let jsonDate = Formatter.dateFormatter.string(from: date)
    json["time"] = jsonDate
    
    return json;
  }
}
