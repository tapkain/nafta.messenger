//
//  TokenModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TokenModel: Codable {
  var accessToken = ""
  var expiresAt = ""
  var expiresIn = 0
  var issuedAt = ""
  var tokenType = ""
  var username = ""
  
  static func fromJson(json: JSON) -> TokenModel {
    var tokenModel = TokenModel()
    tokenModel.accessToken = json["access_token"].string!
    tokenModel.expiresAt = json[".expires"].string!
    tokenModel.expiresIn = json["expires_in"].int!
    tokenModel.issuedAt = json[".issued"].string!
    tokenModel.tokenType = json["token_type"].string!
    tokenModel.username = json["userName"].string!
    return tokenModel
  }
}
