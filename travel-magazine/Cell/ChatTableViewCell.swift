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
    
    var chatList: [Chat]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    func configureCellUI() {
        //임시
        chatProfileIMGView.image = UIImage.bran
        chatUserNameLabel.text = "Bran"
        chatMessageBox.text = ""
        chatMessageBox.numberOfLines = 0
        chatMessageBox.layer.borderWidth = 1
        chatMessageBox.layer.borderColor = UIColor.lightGray.cgColor
        chatMessageBox.layer.cornerRadius = 10
        chatMessageText.text = "푸시푸시푸시푸시푸시푸시 잔디는 생물인거 아시죵 매일 물을 주셔야 살 수 있습니다 으하핳하 푸시"
        chatMessageText.numberOfLines = 0
        chatDateLabel.text = "08:16 오후"
    }
    
    func configureCellData(_ chatData: [Chat]) {
        print(chatData)
    }
}
