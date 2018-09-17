//
//  Extension+TextField.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 13.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

extension UITextField {

    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.4)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
