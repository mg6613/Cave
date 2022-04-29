//
//  LoginViewController.swift
//  Cave
//
//  Created by 유민규 on 2022/02/18.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    // 이메일 필드 생성
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    // 패스워드 필드 생성
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    // 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Serviced", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    //
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    // 회원가입 버튼
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    // 헤더 뷰
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "whyn_back")) // 헤더뷰 이미지 추가
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                                                    action: #selector(didTapLoginButton),
                                                    for: .touchUpInside)
        createAccountButton.addTarget(self,
                                                    action: #selector(didTapCreateAccountButton),
                                                    for: .touchUpInside)
        termsButton.addTarget(self,
                                                    action: #selector(didTapTermsButton),
                                                    for: .touchUpInside)
        privacyButton.addTarget(self,
                                                    action: #selector(didTapPrivacyButton),
                                                    for: .touchUpInside)
        
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews() // 서브뷰를 추가해야 보인다
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
            // assign frames
            
            // 헤더 뷰 사이즈 생성
            headerView.frame = CGRect(
                x: 0,
                            y: 0.0,
//                y: view.safeAreaInsets.top,
                width: view.width,
                height: view.height/2.5
            )
            // 유저 이메일 필드 사이즈
            usernameEmailField.frame = CGRect(
                x: 25,
                y: headerView.bottom + 10,
                width: view.width - 50,
                height: 52.0
            )
            // 패스워드 필드 사이즈
            passwordField.frame = CGRect(
                x: 25,
                y: usernameEmailField.bottom + 10,
                width: view.width - 50,
                height: 52.0
            )
            // 로그인 버튼 사이즈
            loginButton.frame = CGRect(
                x: 25,
                y: passwordField.bottom + 10,
                width: view.width - 50,
                height: 52.0
            )
            // 회원가입 버튼 사이즈
            createAccountButton.frame = CGRect(
                x: 25,
                y: loginButton.bottom + 10,
                width: view.width - 50,
                height: 52.0
            )
        
        // 서비스 약관 버튼 사이즈
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width-20,
                                   height: 50)
        
        // 개인정보정책 버튼 사이즈
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width-20,
                                   height: 50)

            configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // Add instagram logo
        let imageView = UIImageView(image: UIImage(named: "whyn_wine"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
        
    }
    // 추가할 뷰 Function
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    // 로그인 버튼
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let  usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                  return
              }
        
        var username: String?
        var email: String?
        
        // 이메일 or 유저이름
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
        }
        else {
            // username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user logged in 로그인 성공시
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    // error occurred 로그인 실패시
                    let alert = UIAlertController(title: "Log In Error", message: "We were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
            
        }
        
    }
    
    // 서비스 약관 버튼
    @objc private func didTapTermsButton() {
        guard let url = URL(string:"https://www.termsfeed.com/blog/sample-terms-of-service-template/") else {
            return
        }
        let vc = SFSafariViewController(url:url)
        present(vc, animated: true)
    }
    
    // 개인 정보 정책
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string:"http://ko.wordow.com/english/dictionary/privacy%20policy") else {
            return
        }
        let vc = SFSafariViewController(url:url)
        present(vc, animated: true)
    }
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        
        present(UINavigationController(rootViewController:  vc), animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        
        return true
    }
}
