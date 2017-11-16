//
//  ChatApiManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class ChatApiManager {
//  func getChats() -> Promise<[ChatModel]> {
//    let q = DispatchQueue.global()
//    let url = "\(ApiManager.api)/api/chats"
//    
//    return firstly {
//      Alamofire.request(url).validate().responseString()
//      }.then(on: q) {
//        let json = JSON(parseJSON: $0)
//        var chats = [ChatModel]()
//        
//        for (_, chatJson) in json {
//          let chat = ChatModel.fromJson(json: chatJson)
//          chats.append(chat)
//        }
//        
//        return Promise(value: chats)
//    }
//  }
}
