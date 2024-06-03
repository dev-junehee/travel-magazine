//
//  UITableViewCell+Extension.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

extension UITableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
    
}
