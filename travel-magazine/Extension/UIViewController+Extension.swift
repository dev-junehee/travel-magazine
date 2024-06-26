//
//  UIViewController+Extension.swift
//  travel-magazine
//
//  Created by junehee on 5/28/24.
//

import UIKit

enum barButtonType {
    case left
    case right
}

extension UIViewController: ReuseIdentifierProtocol {
    // MARK: 연산 프로퍼티로 identifier 사용
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: Navigation 네비게이션
    // 네비게이션 아이템 타이틀 설정
    func configureViewTitle(_ title: String) {
        navigationItem.title = title
    }
    
    // 네비게이션 아이템 BarButton 설정 - text
    func configureTextBarButton(title: String?, style: UIBarButtonItem.Style, target: Any?, action: Selector?, type: barButtonType) {
        let barButton = UIBarButtonItem(title: title, style: style, target: target, action: action)
        
        barButton.tintColor = Colors.black
        
        switch type {
        case .left:
            navigationItem.leftBarButtonItem = barButton
        case .right:
            navigationItem.rightBarButtonItem = barButton
        }
    }
    
    // 네비게이션 아이템 BarButton 설정 - image
    func configureImageBarButton(title: String?, image: String, target: AnyObject?, action: Selector?, type: barButtonType) {
        let barButton = UIBarButtonItem(title: title, image: UIImage(systemName: image), target: target, action: action)
        
        barButton.tintColor = Colors.black
        
        switch type {
        case .left:
            navigationItem.leftBarButtonItem = barButton
        case .right:
            navigationItem.rightBarButtonItem = barButton
        }
    }
    
    // MARK: Alert 얼럿
    func showAlert(_ titleMSG: String) {
        let alert = UIAlertController(
            title: titleMSG,
            message: nil,
            preferredStyle: .alert)
        
        let warning = UIAlertAction(title: "확인", style: .default)
        alert.addAction(warning)
        present(alert, animated: true)
    }
}
