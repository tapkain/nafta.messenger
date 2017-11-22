//
//  ChatListTableViewCell.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/5/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
  static let cellIdentifier = String(describing: ChatListTableViewCell.self)
  
  @IBOutlet weak var chatName: UILabel!
  @IBOutlet weak var chatIcon: UILabel!
  
  func configure(chat: ChatModel) {
    chatName.text = chat.name
    chatIcon.layer.cornerRadius = chatIcon.frame.size.width / 2
    chatIcon.clipsToBounds = true
    chatIcon.backgroundColor = UIColor.randomFlat()
    chatIcon.text = chat.shortName
  }
}
