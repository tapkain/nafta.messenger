//
//  SignupViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/15/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit
import PromiseKit

class SignupViewController: UIViewController
{
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var surnameTextField: UITextField!
  @IBOutlet weak var sexTextField: UITextField!
  @IBOutlet weak var bornDateTextField: UITextField!
  @IBOutlet weak var phoneNumberTextField: UITextField!

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
  
  func translateToMainView() {
    let appDelegate = UIApplication.shared.delegate
    let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
    appDelegate?.window??.rootViewController = viewController
  }
  
  @IBAction func onFinishButtonPressed(_ sender: UIButton) {
    let email = emailTextField.text!
    let password = passwordTextField.text!
    
    if password != confirmPasswordTextField.text! {
      self.showError(title: "Check fields", message: "Passwords aren't matching")
      return
    }
    
    let bornDate = Formatter.dateFormatter.date(from: bornDateTextField.text!)!
    let registrationDate = Date()
    let registrationModel = RegistrationModel(email: email, password: password, confirmPassword: password, name: nameTextField.text!, surname: surnameTextField.text!, sex: sexTextField.text!, bornDate: bornDate, phoneNumber: phoneNumberTextField.text!, registrationDate: registrationDate)
    
    activityIndicator.startAnimating()
    firstly {
      ApiManager.account.signup(registrationModel: registrationModel)
    }.then { _ in
      ApiManager.account.login(email: registrationModel.email, password: registrationModel.password)
    }.then { token -> Void in
      try! SessionManager.sharedInstance.setSession(token: token, remember: false)
      self.translateToMainView()
    }.always {
      self.activityIndicator.stopAnimating()
    }.catch { error in
        self.showError(title: "Signup failed", message: "Please, change login or try later")
    }
  }
  
  func showError(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(okAction)
    present(alert, animated: true)
  }
}
