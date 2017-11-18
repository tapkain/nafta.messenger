//
//  AlertManager.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/18/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAlertWithOK(title: String, description: String) {
    let alert = UIAlertController(title: title, message: description, preferredStyle: .actionSheet)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    present(alert, animated: true)
  }
  
  func showConnectionError() {
    showAlertWithOK(title: "No internet connection", description: "Check your internet connection and retry later")
  }
}
