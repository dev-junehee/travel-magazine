//
//  UILable+Extension.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

extension UILabel {
    
    func setTitleLabel() {
        self.font = .boldSystemFont(ofSize: 16)
    }
    
    func setSubTitleLable() {
        self.font = .systemFont(ofSize: 14)
        self.numberOfLines = 0
    }
    
    func setDescriptionLabel() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .systemGray
        self.numberOfLines = 0
    }
    
    func randomBackgroundColor() {
        let R = CGFloat.random(in: 0...1)
        let G = CGFloat.random(in: 0...1)
        let B = CGFloat.random(in: 0...1)
        
        let color = UIColor(red: R, green: G, blue: B, alpha: 0.5)
        self.backgroundColor = color
    }
    
}
