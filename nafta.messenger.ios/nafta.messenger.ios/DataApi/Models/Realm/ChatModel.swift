//
//  ChatModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/1/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class ChatModel: Object {
  @objc dynamic var id = 0
  @objc dynamic var name = ""
  @objc dynamic var creationDate = ""
}
