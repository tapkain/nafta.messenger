//
//  RegistrationModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/13/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

struct RegistrationModel: Codable {
  var email = ""
  var password = ""
  var confirmPassword = ""
  var name = ""
  var surname = ""
  var sex = ""
  var bornDate: Date! = nil
  var phoneNumber = ""
  var registrationDate: Date! = nil
}
