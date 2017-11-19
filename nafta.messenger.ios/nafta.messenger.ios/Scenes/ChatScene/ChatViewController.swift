//
//  ChatViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/12/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit
import QMChatViewController

class ChatViewController: QMChatViewController {
  var receiver: UserModel! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //senderID = UInt(UserManager.sharedInstance.currentUser.id)
    //senderDisplayName = UserManager.sharedInstance.currentUser.username
    
  }
  
  override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: UInt, senderDisplayName: String!, date: Date!) {
    //add message to data source
//    MessageManager.sharedInstance.sendMessage(receiverId: receiver.id, text: text) { result in
//
//    }
  }
  
  override func viewClass(forItem item: QBChatMessage!) -> AnyClass! {
    if item.senderID != senderID {
      return QMChatIncomingCell.self
    } else {
      return QMChatOutgoingCell.self
    }
  }
}
