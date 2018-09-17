//
//  View.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 11.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginView: UIView, UITextFieldDelegate {
    
    var stackView: UIStackView!
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    var registrationAction: (() -> Void)?
    
    let logoImage: UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "logo"))
        return img
    }()
    
    
    let label: UILabel = {
        let l = UILabel()
        l.textColor = UIColor.black
        l.font = UIFont(name: "AvenirNext-Medium", size: 18)
        l.text = "твой личный эко вклад"
        l.textAlignment = .center
        return l
    }()
    
    let hideLabel: UILabel = {
        let l = UILabel()
        l.textColor = UIColor.white
        l.text = "Email или номер телефона"
        l.font = UIFont(name: "Montserrat-Medium", size: 14)
        return l
    }()
    
    let textField: SkyFloatingLabelTextField = {
        
        let tf = SkyFloatingLabelTextField(frame: CGRect(10, 10, 200, 45))
        
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.clearButtonMode = .whileEditing
        tf.keyboardType = .emailAddress
        
        tf.placeholder = "Email или номер телефона"
        tf.title = "Email или номер телефона"
        
        tf.lineHeight = 0.5
        tf.selectedLineHeight = 0.5
        tf.lineColor = UIColor(r: 194, g: 194, b: 194, alpha: 1)
        tf.selectedLineColor = UIColor.tazaGreen
        tf.selectedTitleColor = UIColor.tazaGreen
        
        return tf
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.backgroundColor = UIColor.tazaGreen
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
        btn.setTitle("ВОЙТИ", for: .normal)
        return btn
    }()
    
    let regButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        btn.setTitle("ВСТУПИТЬ В РЯДЫ ЗЕЛЕНЫХ", for: .normal)
        btn.setTitleColor(UIColor(r: 30, g: 177, b: 5, alpha: 1), for: .normal)
        btn.layer.borderColor = UIColor.tazaGreen.cgColor
        btn.layer.borderWidth = 2
        
        btn.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        setupViews()
        setupConstraints()
        
        textField.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleRegistration(){
        registrationAction?()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginButton.backgroundColor = UIColor.tazaGreen
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            loginButton.backgroundColor = UIColor(r: 30, g: 177, b: 5, alpha: 0.5)
        } else {
            loginButton.backgroundColor = UIColor.tazaGreen
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
        if (textField.text?.isEmpty)! {
            textField.lineColor = UIColor(r: 194, g: 194, b: 194, alpha: 1)
        } else {
            textField.lineColor = UIColor.tazaGreen
            textField.titleColor = UIColor.tazaGreen
    }
}
    
    func setupViews() {
        
        stackView = createVerticalStackview(views: [textField, loginButton])
        
        [logoImage, label, stackView, regButton].forEach() {
            addSubview($0)
        }
    }
    
    func setupConstraints() {
        
        logoImage.anchor(top: safeTopAnchor, leading: nil, bottom: nil, trailing: nil,
                    padding: .init(top: 90, left: 0, bottom: 0, right: 0),
                    size: .init(width: self.frame.width/1.9736, height: safeAreaHeight/14.5347))
        
//        logoImage.anchorSize(to: self, multiplierWidth: 1.9736, multiplierHeight: 14.5347)
        logoImage.centerX(to: self)
        
        label.anchor(top: logoImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil,
                     padding: .init(top: 11, left: 0, bottom: 0, right: 0),
                     size: .init(width: self.frame.width/1.1329, height: self.frame.height/25.6538))
        label.centerX(to: logoImage)
        
        topConstraint = stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 105)
        topConstraint?.isActive = true
        bottomConstraint = stackView.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: 0)
        bottomConstraint?.isActive = false
        
        stackView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: self.frame.width/1.1467, height: safeAreaHeight/5.6))
        
        stackView.centerX(to: self)
        
        regButton.anchor(top: nil, leading: nil, bottom: safeBottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 40, right: 0), size: .init(width: self.frame.width/1.1467, height: safeAreaHeight/13.15909))
        regButton.centerX(to: self)
        
    }
}

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
