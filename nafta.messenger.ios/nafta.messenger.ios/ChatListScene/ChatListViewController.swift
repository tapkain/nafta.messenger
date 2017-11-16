//
//  ChatListViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/16/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//
import UIKit

class ChatListViewController: UITableViewController {
  var chats = [ChatModel]()
  
  @IBAction func createChat(_ sender: Any) {
    
  }
  
  override func viewDidLoad() {
   // updateChats()
    tableView.register(ChatListTableViewCell.self, forCellReuseIdentifier: ChatListTableViewCell.cellIdentifier)
    super.viewDidLoad()
  }
}


extension ChatListViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chats.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.cellIdentifier) as! ChatListTableViewCell
    let chat = chats[indexPath.row]
    //cell.configure(user: chat.receiver!, message: chat.messages.last)
    return cell
  }
}
