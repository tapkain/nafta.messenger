//
//  UserInfoModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/16/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

struct UserInfoModel: Codable {
  var email = ""
  var isRegistered = false
  var loginProvider = ""
}
