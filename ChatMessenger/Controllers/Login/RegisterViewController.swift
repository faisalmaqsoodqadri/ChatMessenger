//
//  RegisterViewController.swift
//  ChatMessenger
//
//  Created by Faisal Maqsood Qadri on 27/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {
  
  private let scrollView: UIScrollView = {
    
    let scrollView = UIScrollView()
    scrollView.clipsToBounds = true
    // sdasdas
    
    
   // asdasdasd
   //§ asdasdas
    return scrollView
    //asdasd
  }()
  
  private let imageView : UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "circle")
    imageView.tintColor = .gray
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
  
  private let firstNamefield : UITextField = {
    
    let field = UITextField()
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.returnKeyType = .continue
    field.layer.cornerRadius = 12
    field.layer.borderWidth = 1
    field.layer.borderColor = UIColor.lightGray.cgColor
    field.placeholder = "First name "
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    field.leftViewMode = .always
    field.backgroundColor = .white
    return field
    
  }()
  
  private let lastNamefield : UITextField = {
    
    let field = UITextField()
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.returnKeyType = .continue
    field.layer.cornerRadius = 12
    field.layer.borderWidth = 1
    field.layer.borderColor = UIColor.lightGray.cgColor
    field.placeholder = "Last name "
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
  
  private let RegisterButton : UIButton = {
    
    let button = UIButton()
    button.setTitle("Regsiter", for: .normal)
    button.backgroundColor = .systemGreen
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
    view.addSubview(scrollView)
    
    emailfield.delegate = self
    passwordField.delegate = self
    scrollView.addSubview(imageView)
    scrollView.addSubview(firstNamefield)
    scrollView.addSubview(lastNamefield)
    scrollView.addSubview(emailfield)
    scrollView.addSubview(passwordField)
    scrollView.addSubview(RegisterButton)
    scrollView.isUserInteractionEnabled = true
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangProfilePic))
    
    imageView.addGestureRecognizer(gesture)
    imageView.isUserInteractionEnabled = true
    RegisterButton.addTarget(self, action: #selector(RegisterButtonTapped), for: .touchUpInside)
    
    
    
  }
  
  @objc func didTapChangProfilePic()  {
    
   print("Profile picture seleected ")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    
    
    scrollView.frame = view.bounds
    
    let size = scrollView.width/3
    imageView.frame = CGRect(x: (scrollView.width - size) / 2,
                             y: 120,
                             width: size,
                             height: size)
    
    
    
    firstNamefield.frame = CGRect(x: 30,
                                  y: imageView.bottom + 10 ,
                                  width: scrollView.width - 60,
                                  height: 52)
    
    
    lastNamefield.frame = CGRect(x: 30,
                                 y: firstNamefield.bottom + 10 ,
                                 width: scrollView.width - 60,
                                 height: 52)
    
    
    
    
    emailfield.frame = CGRect(x: 30,
                              y: lastNamefield.bottom + 10 ,
                              width: scrollView.width - 60,
                              height: 52)
    
    
    
    passwordField.frame = CGRect(x: 30,
                                 y: emailfield.bottom + 10 ,
                                 width: scrollView.width - 60,
                                 height: 52)
    
    RegisterButton.frame = CGRect(x: 30,
                                  y: passwordField.bottom + 10 ,
                                  width: scrollView.width - 60,
                                  height: 52)
    
    
    
    
  }
  
  @objc private func  RegisterButtonTapped(){
    
    emailfield.resignFirstResponder()
    passwordField.resignFirstResponder()
    firstNamefield.resignFirstResponder()
    lastNamefield.resignFirstResponder()
    
    guard let email = emailfield.text,
          let password = passwordField.text,
        !email.isEmpty, !password.isEmpty, password.count >= 6 else {
      alertUserLoginError()
      return
    }
    
    // Firebase Login function
  }
  
  func alertUserLoginError(){
    
    let alert = UIAlertController(title: "woops", message: "Please enter all information to Create Account ", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
    
  }
  
  
  @objc private func  didTapRegister()  {
    
    let vc = RegisterViewController()
    vc.title = "Register"
    navigationController?.pushViewController(vc, animated: true)
  }
}


extension RegisterViewController : UITextFieldDelegate {
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    if textField == emailfield {
      
    } else if textField == passwordField {
      
      RegisterButtonTapped()
      
    }
    
    return true
  }
  
}
