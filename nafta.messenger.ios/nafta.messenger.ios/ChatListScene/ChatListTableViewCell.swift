//
//  ChatListTableViewCell.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 11/5/17.
//  Copyright © 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
  static let cellIdentifier = String(describing: ChatListViewController.self)
  
  @IBOutlet weak var receiverName: UILabel!
  @IBOutlet weak var userImage: UIImageView!
  
  func configure(user: UserModel, message: MessageModel?) {
    receiverName.text = user.username
    userImage.layer.cornerRadius = userImage.frame.size.width / 2
    userImage.clipsToBounds = true
    userImage.tintColor = UIColor.randomFlat()
  }
}
