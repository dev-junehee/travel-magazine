//
//  TravelTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 5/26/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }
    
    func configureCellUI() {
        mainImage.contentMode = .scaleAspectFill
        mainImage.layer.cornerRadius = 10
        
        mainTitle.font = Fonts.title20
        mainTitle.numberOfLines = 0
        
        subTitle.font = Fonts.subTitle16
        subTitle.textColor = Colors.gray
        subTitle.numberOfLines = 0
        
        dateLabel.textAlignment = .right
        dateLabel.textColor = Colors.gray
        dateLabel.font = Fonts.small
        
    }
    
    func configureCellData(data: Magazine) {
        let imageURL = URL(string: data.photo_image)
        mainImage.kf.setImage(with: imageURL)
        mainTitle.text = data.title
        
        subTitle.text = data.subtitle
        
        let date = formatDate(date: data.date)
        dateLabel.text = date
    }
    
    // 날짜 포맷 함수 (yyMMdd -> yyyy년 MM월 dd일)
    func formatDate(date originDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        guard let date = dateFormatter.date(from: originDate) else {
            print("오류")
            return ""
        }
    
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        let formattedString = dateFormatter.string(from: date)
        return formattedString
    }
}

extension TravelTableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)  // self는 클래스의 인스턴스를 의미
    }
    
}

