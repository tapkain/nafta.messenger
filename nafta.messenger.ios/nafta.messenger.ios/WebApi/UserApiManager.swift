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
  
  func getUser(userId: Int, completion: @escaping (UserModel?) -> Void) {
    let url = "\(ApiManager.api)/user/getLogin"
    let params = ["userId": userId]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseString { response in
        switch response.result {
        case .success(let login):
          let user = UserModel()
          user.id = userId
          user.username = login
          completion(user)
          
        case .failure(_):
          completion(nil)
        }
    }
  }
  
  func checkUsername(username: String, completion: @escaping (Bool) -> Void) {
    let url = "\(ApiManager.api)/user/checkUsername"
    let params = ["username": username]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseString { response in
        switch response.result {
        case .success(_):
          completion(true)
          
        case .failure(_):
          completion(false)
        }
    }
  }
}
