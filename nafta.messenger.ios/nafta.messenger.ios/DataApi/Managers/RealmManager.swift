//
//  RealmManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/14/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
  static let sharedInstance = RealmManager()
  
  func setDatabase(name: String) {
    let url = URL(string: "\((Bundle.main.resourceURL?.absoluteString)!)\(name).realm")
    
    var config = Realm.Configuration()
    config.fileURL = url
    Realm.Configuration.defaultConfiguration = config
  }
}
