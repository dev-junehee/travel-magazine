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
        adTextLabel.layer.cornerRadius = 20
        
        adBadgeLabel.textAlignment = .center
        adBadgeLabel.backgroundColor = .white
        adBadgeLabel.layer.cornerRadius = 16
    }
    
    func configureCellData(data: Travel) {
        adTextLabel.text = data.title
    }
}
