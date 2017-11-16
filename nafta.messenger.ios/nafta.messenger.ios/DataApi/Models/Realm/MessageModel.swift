//
//  MessageModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/31/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class MessageModel: Object {
  @objc dynamic var id = 0
  @objc dynamic var text = ""
  @objc dynamic var userId = 0
  @objc dynamic var chatId = 0
  @objc dynamic var time: Double = 0
}
