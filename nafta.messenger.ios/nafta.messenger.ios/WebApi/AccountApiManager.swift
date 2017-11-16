//
//  AccountApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/13/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import PromiseKit
import SwiftyJSON

class AccountApiManager {
  func login(email: String, password: String) -> Promise<TokenModel> {
    let q = DispatchQueue.global()
    let url = "\(ApiManager.api)/token"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    let parameters = ["grant_type": "password", "username": email, "password": password]
    
    return firstly {
      Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).validate().responseString()
      }.then(on: q) {
        let json = JSON(parseJSON: $0)
        let token = TokenModel.fromJson(json: json)
        return Promise(value: token)
    }
  }
  
  func signup(registrationModel: RegistrationModel) -> Promise<String> {
    let url = "\(ApiManager.api)/api/account/register"
    let body = registrationModel.toJson()
    
    return firstly {
      Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: [:]).validate().responseString()
      }
  }
}
