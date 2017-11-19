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
  func getChats() -> Promise<[ChatModel]> {
    let url = "\(ApiManager.api)/api/chats"
    
    return firstly {
      Alamofire.request(url).validate(statusCode: 200...400).responseData()
      }.then {
        try! JSONDecoder().decode([ChatModel].self, from: $0)
    }
  }
  
  func sendMessage(to chat: ChatModel, textContent: String) -> Promise<Void> {
    let url = "\(ApiManager.api)/api/chats/\(chat.id)/send"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    let parameters = ["text": textContent]
    
    return Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).validate().responseString().asVoid()
  }
  
  func getMessages(from chat: ChatModel) -> Promise<[MessageModel]> {
    let url = "\(ApiManager.api)/api/chats/\(chat.id)/messages"
    
    return firstly {
      Alamofire.request(url).responseData()
      }.then {
        try! JSONDecoder().decode([MessageModel].self, from: $0)
    }
  }
  
  func getMembers(from chat: ChatModel) -> Promise<[UserModel]> {
    let url = "\(ApiManager.api)/api/chats/\(chat.id)/members"
    
    return firstly {
      Alamofire.request(url).responseData()
      }.then {
        try! JSONDecoder().decode([UserModel].self, from: $0)
    }
  }
  
  func add(user: UserModel, to chat: ChatModel) -> Promise<Void> {
    let url = "\(ApiManager.api)/api/chats/\(chat.id)/member"
    let body = ["userId": user.id]
    
    return Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: [:]).validate().responseString().asVoid()
  }
  
  func create(name: String, with user: UserModel) -> Promise<Void> {
    let url = "\(ApiManager.api)/api/chats/create/\(name)"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]
    let body = ["friendId": user.id]
    
    return Alamofire.request(url, method: .post, parameters: body, encoding: URLEncoding.httpBody, headers: headers).validate().responseString().asVoid()
  }
}
