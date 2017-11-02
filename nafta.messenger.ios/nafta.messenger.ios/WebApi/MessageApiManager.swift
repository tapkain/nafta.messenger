//
//  MessageApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/31/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import SwiftyJSON

class MessageApiManager {
  func getMessages(timestamp: Int, completion: @escaping ([MessageModel]?) -> Void) {
    let url = "\(ApiManager.api)/messages"
    let userId = UserManager.sharedInstance.currentUser.id
    let params = ["userId": userId, "timestamp": timestamp]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseString { response in
        switch response.result {
        case .success(let value):
          let json = JSON(parseJSON: value)
          var messages = [MessageModel]()
          
          for (_, messageJSON) in json {
            let message = MessageModel.fromJson(messageJSON)
            messages.append(message)
          }
          
          completion(messages)
          
        case .failure(_):
          completion(nil)
        }
    }
  }
  
  //func sendMessage()
}
