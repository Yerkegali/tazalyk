//
//  RegistrationController.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 14.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    var registrationView: RegistrationView!
    
    var navigationTitle: UILabel = {
        let l = UILabel()
        l.text = "Регистрация"
        l.textColor = UIColor.black
        l.font = UIFont(name: "Montserrat-SemiBold", size: 22)
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navigationTitle.text
        self.navigationController?.setNavigationBarHidden(false, animated:false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationController?.navigationBar.backItem?.title = "Отмена"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.tazaGreen

//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(back(_ :)))
//        navigationItem.leftBarButtonItem?.tintColor = UIColor.tazaGreen
//
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        NotificationCenter.default.removeObserver(self)
    }

}

extension RegistrationController {
    
    @objc func emailRegFunction() {
        print("EmailREg")
    }
    
    func setupViews() {
        let mainView = RegistrationView(frame: view.frame)
        self.registrationView = mainView
        self.registrationView.emailRegAction = emailRegFunction
        self.view.addSubview(registrationView)
    }
    
    func setupConstraints() {
        registrationView.fillSuperView()
    }
    
}
