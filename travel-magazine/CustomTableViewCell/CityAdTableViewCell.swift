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
        
        adTextLabel.randomBackgroundColor()
        adTextLabel.clipsToBounds = true
        adTextLabel.layer.cornerRadius = 10
        
        adBadgeLabel.textAlignment = .center
        adBadgeLabel.backgroundColor = .white
        adBadgeLabel.clipsToBounds = true
        adBadgeLabel.layer.cornerRadius = 4
    }
    
    func configureCellData(data: Travel) {
        adTextLabel.text = data.title
    }
}
