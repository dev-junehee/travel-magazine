//
//  RestaurantTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    // 화면에서 눈에 보이는 셀의 수만큼은 실행이 되지만 이후로는 실행X!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }
    
    func configureCellUI() {
        mainTitle.setTitleLabel16()
        subTitle.setSubTitleLabel14()
        descriptionLabel.setDescriptionLabel()
        likeButton.setLikeButton()
    }
    
    func configureCellData(data: Restaurant) {
        
        let url = URL(string: data.image)
        let loading = UIImage(systemName: "fork.nife.circle.fill")
        mainImageView.kf.setImage(with: url, placeholder: loading)
        mainImageView.contentMode = .scaleAspectFill
        
        mainTitle.text = "\(data.name) | \(data.category)"
        subTitle.text = data.address
        descriptionLabel.text = """
        전화번호: \(data.phoneNumber)
        가격대: \(data.price.formatted())원
        """
        
        let heart = data.like ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(heart, for: .normal)
    }
    
}

extension RestaurantTableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
