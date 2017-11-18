//
//  LoginViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/15/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit
import PromiseKit

class LoginViewController: UIViewController {
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var rememberAccountSwitch: UISwitch!
  var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.hidesWhenStopped = true
    
    let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
    view.addConstraint(horizontalConstraint)
    
    let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
    view.addConstraint(verticalConstraint)
    
    if SessionManager.sharedInstance.restoreSession() {
      translateToMainView()
    }
    
    #if DEBUG
      usernameTextField.text = "admin@gmail.com"
      passwordTextField.text = "!@#qwe456RTY"
    #endif
  }
  
  // MARK: Actions
  
  func translateToMainView() {
    let appDelegate = UIApplication.shared.delegate
    let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
    appDelegate?.window??.rootViewController = viewController
  }
  
  @IBAction func onLoginButtonPressed(_ sender: UIButton) {
    let username = usernameTextField.text!
    let password = passwordTextField.text!
    let remember = rememberAccountSwitch.isOn
    activityIndicator.startAnimating()
    
    firstly {
      ApiManager.account.login(email: username, password: password)
    }.then { token -> Void in
      try! SessionManager.sharedInstance.setSession(token: token, remember: remember)
      self.translateToMainView()
    }.always {
      self.activityIndicator.stopAnimating()
    }.catch { error in
      self.showAlertWithOK(title: "Login failed", description: "Invalid username or password!")
    }
  }
}
