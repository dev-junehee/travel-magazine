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
    
    // 셀 UI
    func configureCellUI() {
        popularCityNameLabel.textColor = .white
        
        let bgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        popularCityExplainLabel.backgroundColor = bgColor
    }
    
    // 셀 데이터 바인딩
    func configureCellData(data: City) {
        let url = URL(string: data.city_image)
        popularCityImageView.kf.setImage(with: url)
        
        popularCityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        popularCityExplainLabel.text = data.city_explain
    }
}
