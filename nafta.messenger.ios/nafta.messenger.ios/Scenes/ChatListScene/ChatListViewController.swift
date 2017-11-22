//
//  ChatListViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/16/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//
import UIKit

class ChatListViewController: UITableViewController, UISearchResultsUpdating {
  var chats = [ChatModel]()
  var searchController: UISearchController! = nil
  
  @IBAction func createChat(_ sender: Any) {
    SessionManager.sharedInstance.logout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateChats()
    initSearchController()
  }
  
  func initSearchController() {
    searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.dimsBackgroundDuringPresentation = false
  }
  
  @IBAction func onSearchButtonPressed(_ sender: Any) {
    present(searchController, animated: true)
  }
  
  func updateChats() {
    ApiManager.chats.getChats().then { chats -> Void in
      if RealmManager.sharedInstance.delete(ChatModel.self) && RealmManager.sharedInstance.insert(entities: chats) {
        self.chats = chats
        self.tableView.reloadData()
      }
    }.catch {_ in
      self.chats = (RealmManager.sharedInstance.get(ChatModel.self)?.toArray())!
      self.tableView.reloadData()
    }
  }
}


// MARK - UITableViewDelegate
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
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}


// MARK - UISearchResultsUpdating
extension ChatListViewController {
  func updateSearchResults(for searchController: UISearchController) {
    if let searchText = searchController.searchBar.text, !searchText.isEmpty {
      chats = (RealmManager.sharedInstance.get(ChatModel.self)?.filter("name CONTAINS[cd] %@", searchText).toArray())!
    } else {
      chats = (RealmManager.sharedInstance.get(ChatModel.self)?.toArray())!
    }
    tableView.reloadData()
  }
}
