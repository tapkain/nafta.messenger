//
//  AppDelegate.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/12/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit
import ChameleonFramework
import RealmSwift
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setAppearance()
    setLogging()
    
    var config = Realm.Configuration()
    //config.
    
    let loginController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
    
    self.window?.rootViewController = loginController
    return true
  }
  
  func setAppearance() {
    //Chameleon.setGlobalThemeUsingPrimaryColor(UIColor.flatWatermelon(), with: .dark)
    UIButton.appearance().tintColor = UIColor.flatWhite()
  }
  
  func setLogging() {
    NetworkActivityLogger.shared.level = .debug
    NetworkActivityLogger.shared.startLogging()
  }
  
  func logOut() {
    
  }
}

