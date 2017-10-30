//
//  UserModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class UserModel: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var username: String = ""
  @objc dynamic var password: String = ""
}

extension UserModel {
  static func fromJson(_ json: JSON) -> UserModel {
    let user = UserModel()
    user.id = json["userId"].int!
    user.username = json["login"].string!
    user.password = json["password"].string!
    return user
  }
}
