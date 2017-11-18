//
//  AccountApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/13/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import PromiseKit

class AccountApiManager {
  func login(email: String, password: String) -> Promise<TokenModel> {
    let url = "\(ApiManager.api)/token"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    let parameters = ["grant_type": "password", "username": email, "password": password]
    
    return firstly {
      Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).validate().responseData()
    }.then {
      try! JSONDecoder().decode(TokenModel.self, from: $0)
    }
  }
  
  func signup(registrationModel: RegistrationModel) -> Promise<String> {
    let url = "\(ApiManager.api)/api/account/register"
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    let data = try! encoder.encode(registrationModel)
    let body = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Parameters
    
    return Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: [:]).validate().responseString()
  }
}
