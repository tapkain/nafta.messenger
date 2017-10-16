//
//  LoginModels.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/15/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

enum Login
{
  struct LoginFormFields
  {
    var login: String
    var password: String
    var rememberAccount: Bool
  }
  
  // MARK: Use cases
  
  enum Login
  {
    struct Request
    {
      var loginFormFields: LoginFormFields
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
}
