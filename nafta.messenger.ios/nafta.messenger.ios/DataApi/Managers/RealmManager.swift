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
  
  func insert<Entity: Object>(entity: Entity) -> Bool {
    return insert(entities: [entity])
  }
  
  func insert<Entity: Object>(entities: [Entity]) -> Bool {
    do {
      let realm = try Realm()
      
      try realm.write {
        realm.add(entities)
      }
      
      return true
    } catch {
      return false;
    }
  }
  
  func delete<Entity: Object>(_ entityType: Entity.Type) -> Bool {
    do {
      let realm = try Realm()
      
      try realm.write {
        let entities = realm.objects(entityType)
        realm.delete(entities)
      }
      
      return true
    } catch {
      return false
    }
  }
  
  func setDatabase(name: String) {
    let url = URL(string: "\((Bundle.main.resourceURL?.absoluteString)!)\(name).realm")
    
    var config = Realm.Configuration.defaultConfiguration
    config.fileURL = url
    Realm.Configuration.defaultConfiguration = config
  }
  
  func setInMemoryDatabase() {
    var config = Realm.Configuration.defaultConfiguration
    config.inMemoryIdentifier = "com.nafta.messenger"
    Realm.Configuration.defaultConfiguration = config
  }
  
  func removeDatabase(name: String) {
    let url = URL(string: "\((Bundle.main.resourceURL?.absoluteString)!)\(name).realm")
    try! FileManager.default.removeItem(at: url!)
    Realm.Configuration.defaultConfiguration = Realm.Configuration()
  }
}
