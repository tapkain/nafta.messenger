//
//  TokenModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

struct TokenModel: Codable {
  var accessToken = ""
  var expiresAt = ""
  var expiresIn = 0
  var issuedAt = ""
  var tokenType = ""
  var username = ""
  
  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case expiresAt = ".expires"
    case expiresIn = "expires_in"
    case issuedAt = ".issued"
    case tokenType = "token_type"
    case username = "userName"
  }
}
