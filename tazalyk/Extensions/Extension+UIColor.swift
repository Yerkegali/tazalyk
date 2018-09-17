//
//  Extension+UIColor.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 11.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    static let tazaGreen = UIColor(r: 30, g: 177, b: 5, alpha: 1)
    
}
