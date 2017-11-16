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
  @objc dynamic var id = 0
  @objc dynamic var username = ""
  @objc dynamic var sex = ""
  @objc dynamic var name = ""
  @objc dynamic var surname = ""
  @objc dynamic var bornDate = ""
  @objc dynamic var phoneNumber = ""
}

extension UserModel {
  static func fromJson(_ json: JSON) -> UserModel {
    let user = UserModel()
    user.id = json["id"].int!
    user.username = json["email"].string!
    user.sex = json["sex"].string!
    user.name = json["name"].string!
    user.surname = json["surname"].string!
    user.bornDate = json["bornDate"].string!
    user.phoneNumber = json["phoneNumber"].string!
    
    return user
  }
}
