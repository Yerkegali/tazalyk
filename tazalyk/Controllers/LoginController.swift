//
//  ViewController.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 11.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        NotificationCenter.default.removeObserver(self)
    }

}

extension LoginController {
    
    func setupViews() {
        let mainView = LoginView(frame: view.frame)
        self.loginView = mainView
        self.loginView.registrationAction = registrationButtonTapped
        self.view.addSubview(loginView)
    }
    
    func setupConstraints() {
        loginView.fillSuperView()
    }
    
    func registrationButtonTapped() {
        
        let regVC = RegistrationController()
        self.navigationController?.pushViewController(regVC, animated: true)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue
            else { return }
        let keyboardHeight: CGFloat
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.loginView.topConstraint?.isActive = false
            self.loginView.bottomConstraint?.isActive = true
            self.loginView.bottomConstraint?.constant = -(keyboardHeight + 10)
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(_ notificaiton: Notification) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.loginView.bottomConstraint?.isActive = false
            self.loginView.topConstraint?.isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
}

