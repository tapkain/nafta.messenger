//
//  UserApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import SwiftyJSON
import PromiseKit

class UserApiManager {
  func login(username: String, password: String) -> Promise<UserModel> {
    let q = DispatchQueue.global()
    let url = "\(ApiManager.api)/account"
    let headers = ["grant_type": "password", "username": username, "password": password]
    
    return firstly {
      Alamofire.request(url, method: .post, headers: headers).validate().responseString()
    }.then(on: q) {
      let json = JSON(parseJSON: $0)
      let user = UserModel.fromJson(json)
      return Promise(value: user)
    }
  }
  
  func signup(username: String, password: String) -> Promise<UserModel> {
    let q = DispatchQueue.global()
    let url = "\(ApiManager.api)/user/register"
    let params = ["login": username, "password": password]
      
    return firstly {
      Alamofire.request(url, method: .post, parameters: params).validate().responseString()
    }.then(on: q) {
      let json = JSON(parseJSON: $0)
      let user = UserModel.fromJson(json)
      return Promise(value: user)
    }
  }
  
  func getUser(userId: Int) -> Promise<UserModel> {
    let q = DispatchQueue.global()
    let url = "\(ApiManager.api)/user/getLogin"
    let params = ["userId": userId]
    
    return firstly {
      Alamofire.request(url, method: .get, parameters: params).validate().responseString()
      }.then(on: q) {
        let user = UserModel()
        user.id = userId
        user.username = $0
        return Promise(value: user)
    }
  }
  
  func getUser(username: String) -> Promise<UserModel> {
    let q = DispatchQueue.global()
    let url = "\(ApiManager.api)/user/getUserId"
    let params = ["username": username]
    
    return firstly {
      Alamofire.request(url, method: .get, parameters: params).validate().responseString()
      }.then(on: q) {
        let user = UserModel()
        user.id = Int($0)!
        user.username = username
        return Promise(value: user)
    }
  }
}
