//
//  Helper.swift
//  nafta.messenger.iosTests
//
//  Created by Yevhen Velizhenkov on 11/15/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

class Helper {
  static func getRandomChar() -> Character {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"
    let num = arc4random_uniform(UInt32(chars.count))
    let index = chars.index(chars.startIndex, offsetBy: String.IndexDistance(num))
    return chars[index]
  }
  
  static func generateEmail() -> String {
    var email = ""
    
    for _ in 0..<10 {
      email.append(getRandomChar())
    }
    
    email.append("@")
    
    for _ in 0..<5 {
      email.append(getRandomChar())
    }
    
    email.append(".com")
    return email
  }
  
  static func generatePassword() -> String {
    var password = ""
    
    for _ in 0..<40 {
      password.append(getRandomChar())
    }
    
    return password
  }
}
