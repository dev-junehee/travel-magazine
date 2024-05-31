//
//  PopularCityTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    
    @IBOutlet var popularCityBackView: UIView!
    @IBOutlet var popularCityImageView: UIImageView!
    
    @IBOutlet var popularCityNameLabel: UILabel!
    @IBOutlet var popularCityExplainLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 셀과 셀 사이 간격 조정
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
    }
    
    
    // 셀 UI
    func configureCellUI() {
        // 가장 하위 layerView
        // shadow 처리
        popularCityBackView.backgroundColor = .clear
        popularCityBackView.layer.shadowColor = UIColor.black.cgColor
        popularCityBackView.layer.shadowOffset = CGSize(width: 4, height: 4)
        popularCityBackView.layer.shadowRadius = 4
        popularCityBackView.layer.shadowOpacity = 0.4
        
        // 이미지 뷰
        popularCityImageView.contentMode = .scaleAspectFill
        popularCityImageView.layer.cornerRadius = 16
        popularCityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]  // 좌측상단, 우측하단에만 radius 적용
    
        // 도시 이름 레이블
        popularCityNameLabel.textColor = .white
        popularCityNameLabel.font = .boldSystemFont(ofSize: 20)
        
        // 도시 설명 레이블
        popularCityExplainLabel.textColor = .white
        popularCityExplainLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        let labelBgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        popularCityExplainLabel.backgroundColor = labelBgColor
        popularCityExplainLabel.clipsToBounds = true
        popularCityExplainLabel.layer.cornerRadius = 16
        popularCityExplainLabel.layer.maskedCorners = .layerMaxXMaxYCorner
        
    }
    
    // 셀 데이터 바인딩
    func configureCellData(data: City) {
        // 이미지
        let url = URL(string: data.city_image)
        popularCityImageView.kf.setImage(with: url)
        // 도시 이름/설명
        popularCityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        popularCityExplainLabel.text = "  " + data.city_explain
    }
}

extension PopularCityTableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
