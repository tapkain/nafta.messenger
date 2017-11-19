//
//  ChatApiManagerTests.swift
//  nafta.messenger.iosTests
//
//  Created by Yevhen Velizhenkov on 11/19/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation

import XCTest
@testable import nafta_messenger_ios

class ChatApiManagerTests: XCTestCase {
  static let email = Helper.email
  static let password = Helper.password
  
  func test1ChatCreation() {
    // given
    let promise = expectation(description: "chat created")
    let name = Helper.generateString(length: 6)
    let user = Helper.testUser1
    
    // when
    ApiManager.chats.create(name: name, with: user).then {_ in
      promise.fulfill()
    }.catch { error in
      // then
      XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: 10, handler: nil)
  }
}
