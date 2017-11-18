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
    SessionManager.sharedInstance.logout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(ChatListTableViewCell.self, forCellReuseIdentifier: ChatListTableViewCell.cellIdentifier)
    //updateChats()
  }
  
  func updateChats() {
    ApiManager.chats.getChats().then { chats -> Void in
      if RealmManager.sharedInstance.insert(entities: chats) {
        self.chats = chats
        self.tableView.reloadData()
      }
      }.catch {_ in 
      self.showConnectionError()
    }
  }
}


extension ChatListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return chats.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.cellIdentifier) as! ChatListTableViewCell
    let chat = chats[indexPath.row]
    cell.configure(chat: chat)
    return cell
  }
}
