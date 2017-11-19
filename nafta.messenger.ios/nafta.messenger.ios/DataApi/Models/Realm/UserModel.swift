//
//  UserModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import RealmSwift

class UserModel: Object, Codable {
  @objc dynamic var id = ""
  @objc dynamic var username = ""
  @objc dynamic var sex = ""
  @objc dynamic var name = ""
  @objc dynamic var surname = ""
  @objc dynamic var bornDate = ""
  @objc dynamic var phoneNumber = ""
}
