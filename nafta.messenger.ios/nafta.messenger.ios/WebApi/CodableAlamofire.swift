//
//  CodableAlamofire.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/16/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

extension Alamofire.DataRequest {
  public func responseCodable<T: Codable>() -> Promise<T> {
    return Promise { fulfill, reject in
      responseData(queue: nil) { response in
        switch response.result {
        case .success(let value):
          let decoder = JSONDecoder()
          do {
            fulfill(try decoder.decode(T.self, from: value))
          } catch let e {
            reject(e)
          }
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
}
