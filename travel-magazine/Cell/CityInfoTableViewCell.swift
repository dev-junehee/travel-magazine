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
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    
    func configureCellUI() {
        placeTitle.textColor = .black
        placeTitle.font = .boldSystemFont(ofSize: 16)
        
        placeSubTitle.textColor = .darkGray
        placeSubTitle.font = .boldSystemFont(ofSize: 12)
        placeSubTitle.numberOfLines = 0
        
        placeRateLabel.textColor = .darkGray
        placeRateLabel.font = .systemFont(ofSize: 12)
        
        cityImageView.layer.cornerRadius = 8
        
        likeButton.tintColor = .systemPink
    }
    
    func configureCellData(data: Travel) {
        placeTitle.text = data.title
        placeSubTitle.text = data.description
        placeRateLabel.text = """
        별점 \(String(describing: data.grade!))/5 • 저장 \(String(describing: data.save!.formatted()))
        """
        
        let url = URL(string: data.travel_image!)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        
        guard let heart = data.like! ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart") else { return }
        likeButton.setImage(heart, for: .normal)
        likeButton.backgroundColor = .clear
    }
}

extension CityInfoTableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
