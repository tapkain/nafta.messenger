//
//  ChatListViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/16/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//
import UIKit

class ChatListViewController: UITableViewController {
  @IBAction func createChat(_ sender: Any) {
    let alertController = UIAlertController(title: "New Chat", message: nil, preferredStyle: .alert)
    
    let createAction = UIAlertAction(title: "Create", style: .default) { [weak alertController] _ in
      if let alertController = alertController {
        let usernameTextField = alertController.textFields![0] as UITextField
        
        //login(loginTextField.text, passwordTextField.text)
      }
    }
    createAction.isEnabled = false
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
   
    alertController.addTextField { textField in
      textField.placeholder = "Username"
      NotificationCenter.default.addObserver(forName: Notification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { notification in
        //UserManager.sharedInstance.ge
        //createAction.enabled = textField.text != ""
      }
    }
    
    
    alertController.addAction(createAction)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true)
  }
  
  override func viewDidLoad() {
    ChatManager.sharedInstance.updateChats {_ in 
      self.tableView.reloadData()
    }
    super.viewDidLoad()
  }
  
  
}
