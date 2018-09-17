//
//  Extension+StackView.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 13.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

extension UIView {
    
    func createVerticalStackview(views: [UIView]) -> UIStackView{
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }
    
}
