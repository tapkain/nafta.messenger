//
//  UserApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import SwiftyJSON

class UserApiManager {
  func login(username: String, password: String, completion: @escaping (UserModel?) -> Void) {
    let url = "\(ApiManager.api)/user/login"
    let params = ["login": username, "password": password]
    
    Alamofire.request(url, method: .post, parameters: params)
      .validate()
      .responseString { response in
      switch response.result {
      case .success(let value):
        let json = JSON(parseJSON: value)
        let user = UserModel.fromJson(json)
        completion(user)
        
      case .failure(_):
        completion(nil)
      }
    }
  }
  
  func signup(username: String, password: String, completion: @escaping (UserModel?) -> Void) {
    let url = "\(ApiManager.api)/user/register"
    let params = ["login": username, "password": password]
    
    Alamofire.request(url, method: .post, parameters: params)
      .validate()
      .responseString { response in
      switch response.result {
      case .success(let value):
        let json = JSON(parseJSON: value)
        let user = UserModel.fromJson(json)
        completion(user)
        
      case .failure(_):
        completion(nil)
      }
    }
  }
}
