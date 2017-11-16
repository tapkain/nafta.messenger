//
//  RegistrationModel.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/13/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RegistrationModel {
  var email = ""
  var password = ""
  var confirmPassword = ""
  var name = ""
  var surname = ""
  var sex = ""
  var bornDate: Date! = nil
  var phoneNumber = ""
  var registrationDate: Date! = nil
  
  func toJson() -> [String: String] {
    var json = [String: String]()
    json["Email"] = email
    json["Password"] = password
    json["ConfirmPassword"] = confirmPassword
    json["Name"] = name
    json["Surname"] = surname
    json["Sex"] = sex
    json["BornDate"] = Formatter.dateFormatter.string(from: bornDate)
    json["PhoneNumber"] = phoneNumber
    json["RegistrationDate"] = Formatter.dateFormatter.string(from: bornDate)
    json["PhoneNumber"] = phoneNumber
    
    return json
  }
}
