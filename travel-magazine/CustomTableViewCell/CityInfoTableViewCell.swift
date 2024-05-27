//
//  CityInfoTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit
import Kingfisher

class CityInfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var placeTitle: UILabel!
    @IBOutlet var placeSubTitle: UILabel!
    @IBOutlet var placeRateLabel: UILabel!
    
    @IBOutlet var cityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    
    func configureCellUI() {
        placeTitle.font = .boldSystemFont(ofSize: 14)
        
        placeTitle.textColor = .darkGray
        placeSubTitle.font = .boldSystemFont(ofSize: 10)
        
        placeRateLabel.textColor = .darkGray
        placeRateLabel.font = .systemFont(ofSize: 10)
        
        cityImageView.layer.cornerRadius = 12
    }
    
    func configureCellData(data: Travel) {
        placeTitle.text = data.title
        placeSubTitle.text = data.description
        placeRateLabel.text = """
        별점 \(String(describing: data.grade))/5 • 저장 \(String(describing: data.save?.formatted()))
        """
        
//        let url = URL(string: data.travel_image)
//        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
    }
    
    
    
}
