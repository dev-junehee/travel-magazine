//
//  myChatTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 6/4/24.
//

import UIKit

class myChatTableViewCell: UITableViewCell {
    
    @IBOutlet var myChatMessageBox: UILabel!
    @IBOutlet var myChatMessageText: UILabel!
    
    @IBOutlet var myChatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    func configureCellUI() {
        myChatMessageBox.text = ""
        myChatMessageBox.numberOfLines = 0
        myChatMessageBox.clipsToBounds = true
        myChatMessageBox.layer.borderWidth = 1
        myChatMessageBox.layer.borderColor = Colors.lightGray4.cgColor
        myChatMessageBox.layer.cornerRadius = 10
        myChatMessageBox.backgroundColor = Colors.lightGray6
        
        myChatMessageText.numberOfLines = 0
        myChatMessageText.font = Fonts.subTitle14
        
        myChatDateLabel.font = Fonts.small
        myChatDateLabel.textColor = Colors.gray
    }
    
    func configureCellData(data: Chat) {
        myChatMessageText.text = data.message
        myChatDateLabel.text = data.date
    }
}
