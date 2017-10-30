//
//  LoginViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/15/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

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
  }
  
  // MARK: Actions
  
  @IBAction func onLoginButtonPressed(_ sender: UIButton) {
    let username = usernameTextField.text!
    let password = passwordTextField.text!
    activityIndicator.startAnimating()
    
    UserManager.sharedInstance.login(username: username, password: password) { user in
      defer {
        self.activityIndicator.stopAnimating()
      }
      
      guard let _ = user else {
        self.showErrorDialog()
        return
      }
      
      let appDelegate = UIApplication.shared.delegate
      let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
      appDelegate?.window??.rootViewController = viewController
    }
  }
  
  func showErrorDialog() {
    let alert = UIAlertController(title: "Login failed", message: "Invalid username or password!", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(okAction)
    present(alert, animated: true)
  }
}
