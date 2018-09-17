//
//  RegistrationVIew.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 14.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegistrationView: UIView, UITextFieldDelegate {
    
    var emailRegAction: (() -> Void)?
    
    let segmentedControl: UISegmentedControl = {
        
        let items = ["Почта", "Номер телефона"]
        let sc = UISegmentedControl(items: items)
        sc.tintColor = UIColor.tazaGreen
        
        sc.selectedSegmentIndex = 0
        
        return sc
    }()
    
    let emailView: UIView = {
        let view = UIView()
        return view
    }()

    let numberView: UIView = {
        let view = UIView()
        return view
    }()
    
    let emailTextField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField(frame: CGRect(10, 10, 200, 45))
        
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.clearButtonMode = .whileEditing
        tf.keyboardType = .emailAddress
        
        tf.placeholder = "Email"
        tf.title = "Email address"
        tf.errorColor = UIColor.red
        
        tf.lineHeight = 0.5
        tf.selectedLineHeight = 0.5
        tf.lineColor = UIColor(r: 194, g: 194, b: 194, alpha: 1)
        tf.selectedLineColor = UIColor.tazaGreen
        tf.selectedTitleColor = UIColor.tazaGreen
        
        return tf
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.backgroundColor = UIColor(r: 30, g: 177, b: 5, alpha: 0.5)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
        btn.setTitle("ПРОДОЛЖИТЬ", for: .normal)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(handleEmailReg), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = UIColor.white
        
        emailTextField.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            nextButton.backgroundColor = UIColor(r: 30, g: 177, b: 5, alpha: 0.5)
        } else {
            nextButton.backgroundColor = UIColor.tazaGreen
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        if (emailTextField.text?.isEmpty)! {
            emailTextField.lineColor = UIColor(r: 194, g: 194, b: 194, alpha: 1)
        } else {
            emailTextField.lineColor = UIColor.tazaGreen
            emailTextField.titleColor = UIColor.tazaGreen
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
                if(text.count < 3 || !text.contains("@")) {
                    floatingLabelTextField.errorMessage = "Invalid email"
                    nextButton.backgroundColor = UIColor(r: 30, g: 177, b: 5, alpha: 0.5)
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = nil
                    nextButton.backgroundColor = UIColor.tazaGreen
                    nextButton.isEnabled = true
                }
            }
        }
        return true
    }
    
    @objc func handleEmailReg() {
        emailRegAction?()
    }
    
    func setupViews() {
        emailView.addSubview(emailTextField)
        emailView.addSubview(nextButton)
        
        [segmentedControl, emailView].forEach() {
            addSubview($0)
        }
        
    }
    
    func setupConstraints() {
        
        segmentedControl.anchorTop(top: safeTopAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
        segmentedControl.anchorSize(to: self, multiplierWidth: 1.09, multiplierHeight: 20.843)
        segmentedControl.centerX(to: self)
        
        emailView.anchorTop(top: segmentedControl.bottomAnchor)
        emailView.anchorSize(to: self, multiplierWidth: 1.09, multiplierHeight: 3.1)
        emailView.centerX(to: self)
        
        emailTextField.anchorTop(top: emailView.topAnchor, padding: .init(top: 70, left: 0, bottom: 0, right: 0))
        emailTextField.anchorSize(to: self, multiplierWidth: 1.09, multiplierHeight: 15.159)
        emailTextField.centerX(to: self)
        
        nextButton.anchorTop(top: emailTextField.bottomAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        nextButton.anchorSize(to: self, multiplierWidth: 1.09, multiplierHeight: 13.895)
        nextButton.centerX(to: self)
        
    }
    
}
