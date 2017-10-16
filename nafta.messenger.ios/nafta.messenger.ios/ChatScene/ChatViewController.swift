//
//  ChatViewController.swift
//  nafta.messenger.ios
//
//  Created by Yevhen Velizhenkov on 10/12/17.
//  Copyright (c) 2017 Yevhen Velizhenkov. All rights reserved.
//

import UIKit

protocol ChatDisplayLogic: class
{
  func displaySomething(viewModel: Chat.FetchChat.ViewModel)
}

class ChatViewController: UIViewController, ChatDisplayLogic
{
  var interactor: ChatBusinessLogic?
  var router: (NSObjectProtocol & ChatRoutingLogic & ChatDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ChatInteractor()
    let presenter = ChatPresenter()
    let router = ChatRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Chat.FetchChat.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Chat.FetchChat.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
