//
//  Helper.swift
//  nafta.messenger.iosTests
//
//  Created by Yevhen Velizhenkov on 11/15/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

class Helper {
  static func isEmailValid(_ email: String) -> Bool {
    let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: email)
  }
  
  static func getRandomChar() -> Character {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"
    let num = arc4random_uniform(UInt32(chars.count))
    let index = chars.index(chars.startIndex, offsetBy: String.IndexDistance(num))
    return chars[index]
  }
  
  static func generateEmail() -> String {
    var email = ""
    
    repeat {
      email = getEmail()
    } while (!isEmailValid(email))
    
    return email
  }
  
  static func getEmail() -> String {
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
