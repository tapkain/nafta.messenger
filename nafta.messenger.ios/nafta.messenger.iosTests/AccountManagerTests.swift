//
//  SessionManagerTests.swift
//  nafta.messenger.iosTests
//
//  Created by Yevhen Velizhenkov on 11/15/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import XCTest
import RealmSwift
@testable import nafta_messenger_ios

class AccountManagerTests: XCTestCase {
  static let email = Helper.email
  static let password = Helper.password
  
  func test2Login() {
    // given
    let promise = expectation(description: "logined")
    
    // when
    ApiManager.account.login(email: AccountManagerTests.email, password: AccountManagerTests.password).then { token -> Void in
      try! SessionManager.sharedInstance.setSession(token: token, remember: false)
      promise.fulfill()
      }.catch { error in
        // then
        XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: 10, handler: nil)
  }
  
  func test1SignUp() {
    // given
    let promise = expectation(description: "signed up")
    let registrationModel = RegistrationModel(email: AccountManagerTests.email, password: AccountManagerTests.password, confirmPassword: AccountManagerTests.password, name: "iOS Test", surname: "iOS Test", sex: "ios", bornDate: Date(), phoneNumber: "300300191919", registrationDate: Date())
    RealmManager.sharedInstance.setInMemoryDatabase()
    
    // when
    ApiManager.account.signup(registrationModel: registrationModel).then { _ -> Void in
      promise.fulfill()
    }.catch { error in
      // then
      XCTFail(error.localizedDescription)
    }
    
    waitForExpectations(timeout: 10, handler: nil)
  }
}
