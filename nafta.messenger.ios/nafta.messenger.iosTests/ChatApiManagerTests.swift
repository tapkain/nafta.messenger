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
  static var chat = ChatModel()
  
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
    
    waitForExpectations(timeout: Helper.timeout, handler: nil)
  }
  
  func test2GetChats() {
    // given
    let promise = expectation(description: "chats retrieved")
    
    // when
    ApiManager.chats.getChats().then { chats -> Void in
      ChatApiManagerTests.chat = chats.first!
      promise.fulfill()
      }.catch { error in
        // then
        XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: Helper.timeout, handler: nil)
  }
  
  func test3AddUserToChat() {
    // given
    let promise = expectation(description: "user added")
    let user = Helper.testUser2
    
    // when
    ApiManager.chats.add(user: user, to: ChatApiManagerTests.chat).then {_ -> Void in
      promise.fulfill()
      }.catch { error in
        // then
        XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: Helper.timeout, handler: nil)
  }
  
  func test4SendMessage() {
    // given
    let promise = expectation(description: "message sent")
    
    // when
    ApiManager.chats.sendMessage(to: ChatApiManagerTests.chat, textContent: "iOS TEST MESSAGE").then {_ -> Void in
      promise.fulfill()
      }.catch { error in
        // then
        XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: Helper.timeout, handler: nil)
  }
}
