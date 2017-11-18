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
  
  
}
