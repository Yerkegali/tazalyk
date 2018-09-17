//
//  Extension+Anchor.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 11.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom =  bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing  = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func anchorTop(top: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
    }
    
    func anchorLeading(leading: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
    }
    
    func anchorBottom(bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let bottom =  bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
    }
    
    func anchorTrailing(trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let trailing  = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    }
    
    
    func anchorLeadingTrailing(leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing  = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    }
    
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }
        
    var safeAreaHeight: CGFloat {
         if #available(iOS 11.0, *) {
            if let safeHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height {
                return safeHeight
            }
        }
        return frame.height
    }
    
    func centerAnchor(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerY(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerX(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView, multiplierWidth: CGFloat, multiplierHeight: CGFloat) {
        widthAnchor.constraint(equalToConstant: view.frame.width/multiplierWidth).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.height/multiplierHeight).isActive = true
    }
    
    func safeAnchorSize(to view: UIView, multiplierWidth: CGFloat, multiplierHeight: CGFloat) {
    
    if #available(iOS 11.0, *) {
    let safeHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height
    widthAnchor.constraint(equalToConstant: view.frame.width/multiplierWidth).isActive = true
    heightAnchor.constraint(equalToConstant: (safeHeight!)/multiplierHeight).isActive = true
        }
    }
    
    func anchorSizeWidth(to view: UIView, multiplierWidth: CGFloat) {
        widthAnchor.constraint(equalToConstant: view.frame.width/multiplierWidth).isActive = true
    }
    
    func anchorSizeHeight(to view: UIView, multiplierHeight: CGFloat) {
        heightAnchor.constraint(equalToConstant: view.frame.height/multiplierHeight).isActive = true
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
}
