//
//  CityAdTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class CityAdTableViewCell: UITableViewCell {
    
    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }
    
    func configureCellUI() {
        adTextLabel.font = .boldSystemFont(ofSize: 14)
        adTextLabel.textColor = .black
        adTextLabel.textAlignment = .center
        adTextLabel.numberOfLines = 0
        
        adTextLabel.font = .systemFont(ofSize: 12)
        adTextLabel.textAlignment = .center
        adBadgeLabel.layer.cornerRadius = 16
        adBadgeLabel.backgroundColor = .white
    }
    
    func configureCellData(data: Travel) {
        adTextLabel.text = data.title
    }
}
