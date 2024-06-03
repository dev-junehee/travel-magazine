//
//  UILable+Extension.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

extension UILabel {
    func setTitleLabel20() {
        self.font = Fonts.title20
    }
    
    func setTitleLabel16() {
        self.font = Fonts.title16
    }
    
    func setSubTitleLabel16() {
        self.font = Fonts.subTitle16
        self.numberOfLines = 0
    }
    
    func setSubTitleLabel14() {
        self.font = Fonts.subTitle14
        self.numberOfLines = 0
    }
    
    func setDescriptionLabel() {
        self.font = Fonts.small
        self.textColor = Colors.gray
        self.numberOfLines = 0
    }
    
    // 날짜 포맷 함수 (yyMMdd -> yyyy년 MM월 dd일)
//    func formatDate(date originDate: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyMMdd"
//
//        guard let date = dateFormatter.date(from: originDate) else {
//            print("오류")
//            return ""
//        }
//
//        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
//
//        let formattedString = dateFormatter.string(from: date)
//        return formattedString
//    }
}
