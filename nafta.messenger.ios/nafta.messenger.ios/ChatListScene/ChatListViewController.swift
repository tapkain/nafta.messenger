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
    var receiver: UserModel! = nil
    
    let createAction = UIAlertAction(title: "Create", style: .default) { [weak alertController] _ in
      if let _ = alertController {
        MessageManager.sharedInstance.sendMessage(receiver: receiver, text: "Hello!").then {_ -> Void in
          let chatViewController = ChatViewController()
          chatViewController.receiver = receiver
          self.navigationController?.pushViewController(chatViewController, animated: true)
        }
      }
    }
    createAction.isEnabled = false
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
   
    alertController.addTextField { textField in
      textField.placeholder = "Username"
      NotificationCenter.default.addObserver(forName: Notification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { notification in
        UserManager.sharedInstance.getUser(username: textField.text!).then { user -> Void in
          receiver = user
          createAction.isEnabled = true
        }.catch { _ in
          createAction.isEnabled = false
        }
      }
    }
    
    alertController.addAction(createAction)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true)
  }
  
  override func viewDidLoad() {
//    ChatManager.sharedInstance.updateChats {_ in
//      self.tableView.reloadData()
//    }
    super.viewDidLoad()
  }
}
