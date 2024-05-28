//
//  UIViewController+Extension.swift
//  travel-magazine
//
//  Created by junehee on 5/28/24.
//

import UIKit

extension UIViewController {
    // 네비게이션 아이템 타이틀 설정
    func configureViewTitle(_ title: String) {
        navigationItem.title = title
    }
    
    // Alert
    func showAlert() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .alert)
        
        let warning = UIAlertAction(title: "검색어를 입력해 주세요!", style: .default)
        
        alert.addAction(warning)
        
        // 4.화면에 띄우기
        present(alert, animated: true)
    }
}
