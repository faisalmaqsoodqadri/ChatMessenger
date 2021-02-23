//
//  LoginViewController.swift
//  ChatMessenger
//
//  Created by Faisal Maqsood Qadri on 27/12/2020.
//

import UIKit

class LoginViewController: UIViewController {
  
  private let scrollView: UIScrollView = {
    
    let scrollView = UIScrollView()
    scrollView.clipsToBounds = true
    return scrollView
    
  }()
  
  private let imageView : UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logo")
    imageView.contentMode = .scaleAspectFit
    
    return imageView
    
  }()
  
  private let emailfield : UITextField = {
  
    let field = UITextField()
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.returnKeyType = .continue
    field.layer.cornerRadius = 12
    field.layer.borderWidth = 1
    field.layer.borderColor = UIColor.lightGray.cgColor
    field.placeholder = "Email Address..."
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    field.leftViewMode = .always
    field.backgroundColor = .white
    return field
    
  }()
  
  private let passwordField: UITextField = {
    
    let field = UITextField()
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.returnKeyType = .done
    field.layer.cornerRadius = 12
    field.layer.borderWidth = 1
    field.layer.borderColor = UIColor.lightGray.cgColor
    field.placeholder = " Password"
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    field.leftViewMode = .always
    field.backgroundColor = .white
    field.isSecureTextEntry = true
    return field
    
    
  }()
  
  private let loginButton : UIButton = {
    
    let button = UIButton()
    button.setTitle("Login", for: .normal)
    button.backgroundColor = .link
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 12
    button.layer.masksToBounds = true
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    return button
    
    
    
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Login"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
    
    view.backgroundColor = .white
    view.addSubview(imageView)
    
    emailfield.delegate = self
    passwordField.delegate = self
    
    view.addSubview(emailfield)
    view.addSubview(passwordField)
  
    view.addSubview(loginButton)
    
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    
    
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    
    
    scrollView.frame = view.bounds
    
    let size = scrollView.width/3
    imageView.frame = CGRect(x: (scrollView.width - size) / 2,
                             y: 120,
                             width: size,
                             height: size)
    
    
    emailfield.frame = CGRect(x: 30,
                              y: imageView.bottom + 10 ,
                              width: scrollView.width - 60,
                              height: 52)
    
    passwordField.frame = CGRect(x: 30,
                                 y: emailfield.bottom + 10 ,
                                 width: scrollView.width - 60,
                                 height: 52)
    
    loginButton.frame = CGRect(x: 30,
                               y: passwordField.bottom + 10 ,
                               width: scrollView.width - 60,
                               height: 52)
    
    
    
    
  }
  
  @objc private func  loginButtonTapped(){
    
    emailfield.resignFirstResponder()
    passwordField.resignFirstResponder()
    
    guard let email = emailfield.text,let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
          }
    
    // Firebase Login function
  }
  
  func alertUserLoginError(){
    
    let alert = UIAlertController(title: "woops", message: "Please enter all information to login ", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
    
  }
  

  @objc private func  didTapRegister()  {
    
    let vc = RegisterViewController()
    vc.title = "Register"
    navigationController?.pushViewController(vc, animated: true)
  }
}


extension LoginViewController : UITextFieldDelegate {
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    if textField == emailfield {
      
    } else if textField == passwordField {
      
      loginButtonTapped()
      
    }
    
    return true
  }
  
}










