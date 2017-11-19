//
//  UserApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/30/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import PromiseKit

class UserApiManager {
  func getCurrent() -> Promise<UserModel> {
    let url = "\(ApiManager.api)/api/users/current"
    
    return firstly {
      Alamofire.request(url).responseData()
    }.then {
      try! JSONDecoder().decode(UserModel.self, from: $0)
    }
  }
  
  func delete(friend: UserModel) -> Promise<Void> {
    let url = "\(ApiManager.api)/api/friends/\(friend.id)"
    return Alamofire.request(url, method: .delete).responseData().asVoid()
  }
  
  func add(friend: UserModel) -> Promise<Void> {
    let url = "\(ApiManager.api)/api/friends/\(friend.id)"
    return Alamofire.request(url, method: .post).responseData().asVoid()
  }
  
  func getFriends() -> Promise<[UserModel]> {
    let url = "\(ApiManager.api)/api/friends"
    
    return firstly {
      Alamofire.request(url).responseData()
    }.then {
      try! JSONDecoder().decode([UserModel].self, from: $0)
    }
  }
  
  func get(id: String) -> Promise<UserModel> {
    let url = "\(ApiManager.api)/api/users/\(id)"
    
    return firstly {
      Alamofire.request(url).responseData()
    }.then {
      try! JSONDecoder().decode(UserModel.self, from: $0)
    }
  }
}
