//
//  ViewController.swift
//  ChatMessenger
//
//  Created by Faisal Maqsood Qadri on 27/12/2020.
//

import UIKit

class ConversationsViewController: UIViewController {

  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.backgroundColor = .red
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(true)
    let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
    
    if !isLoggedIn {
      let vc = LoginViewController()
      let nav = UINavigationController(rootViewController: vc)
      nav.modalPresentationStyle = .fullScreen
      present(nav, animated: true, completion: nil)
      
  }
 


  }
  
  
}

