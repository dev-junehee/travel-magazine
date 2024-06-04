//
//  ChatTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 6/4/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet var chatProfileIMGView: UIImageView!
    @IBOutlet var chatUserNameLabel: UILabel!
    
    @IBOutlet var chatMessageBox: UILabel!
    @IBOutlet var chatMessageText: UILabel!
    
    @IBOutlet var chatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    func configureCellUI() {
        chatProfileIMGView.layer.borderWidth = 1
        chatProfileIMGView.layer.borderColor = Colors.lightGray4.cgColor
        chatProfileIMGView.layer.cornerRadius = 20
        chatProfileIMGView.contentMode = .scaleAspectFit
        
        chatUserNameLabel.font = Fonts.title16
        
        chatMessageBox.text = ""
        chatMessageBox.numberOfLines = 0
        chatMessageBox.layer.borderWidth = 1
        chatMessageBox.layer.borderColor = Colors.lightGray4.cgColor
        chatMessageBox.layer.cornerRadius = 10
        
        chatMessageText.font = Fonts.subTitle14
        chatMessageText.numberOfLines = 0
        
        chatDateLabel.font = Fonts.small
        chatDateLabel.textColor = Colors.gray
    }
    
    func configureCellData(data: Chat) {
        chatProfileIMGView.image = UIImage(named: data.user.rawValue)
        chatUserNameLabel.text = data.user.rawValue
        chatMessageText.text = data.message
        chatDateLabel.text = data.date
    }
}
