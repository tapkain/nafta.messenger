//
//  Helper.swift
//  nafta.messenger.iosTests
//
//  Created by Yevhen Velizhenkov on 11/15/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
@testable import nafta_messenger_ios

class Helper {
  static let email = generateEmail()
  static let password = generatePassword()
  static let timeout: TimeInterval = 30
 
  static var testUser1: UserModel {
    let user = UserModel()
    user.id = "27f493d1-b8f7-48ac-8c73-c483da4f3d63"
    return user
  }
  
  static var testUser2: UserModel {
    let user = UserModel()
    user.id = "f702f6e1-21f4-4c3a-8c9b-15a22ac1bf25"
    return user
  }
  
  
  static func isEmailValid(_ email: String) -> Bool {
    let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: email)
  }
  
  
  static func getRandomChar() -> Character {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"
    let num = getRandomInt(max: chars.count)
    let index = chars.index(chars.startIndex, offsetBy: String.IndexDistance(num))
    return chars[index]
  }
  
  
  static func getRandomLetter() -> Character {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let num = getRandomInt(max: chars.count)
    let index = chars.index(chars.startIndex, offsetBy: String.IndexDistance(num))
    return chars[index]
  }
  
  
  static func getRandomInt(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
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
    return generateString(length: 40, alphanumeric: true)
  }
  
  
  static func generateString(length: Int, alphanumeric: Bool = false) -> String {
    var result = ""
    
    for _ in 0..<length {
      result.append(alphanumeric ? getRandomChar() : getRandomLetter())
    }
    
    return result
  }
}
