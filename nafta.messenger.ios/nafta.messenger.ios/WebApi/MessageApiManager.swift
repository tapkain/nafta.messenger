//
//  MessageApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/31/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Alamofire
import PromiseKit

class MessageApiManager {
//  func sendMessage(message: MessageModel) -> Promise<String> {
//    let url = "\(ApiManager.api)/messages"
//    let body = message.toJson()
//
//    return Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).validate().responseString()
//  }
//
//  func getMessages(timestamp: Int) -> Promise<[MessageModel]> {
//    let q = DispatchQueue.global()
//    let url = "\(ApiManager.api)/messages"
//    let userId = UserManager.sharedInstance.currentUser.id
//    let params = ["userId": userId, "timestamp": timestamp]
//
//    return firstly {
//      Alamofire.request(url, method: .get, parameters: params).validate().responseString()
//    }.then(on: q) {
//      let json = JSON(parseJSON: $0)
//      var messages = [MessageModel]()
//
//      for (_, messageJSON) in json {
//        let message = MessageModel.fromJson(messageJSON)
//        messages.append(message)
//      }
//
//      return Promise(value: messages)
//    }
//  }
}
