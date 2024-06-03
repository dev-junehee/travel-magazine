//
//  ChatRoomTableViewCell.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    @IBOutlet var chatRoomIMGView: UIImageView!
    @IBOutlet var chatRoomTitle: UILabel!
    @IBOutlet var recentMSG: UILabel!
    @IBOutlet var recentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellUI()
    }

    func configureCellUI() {
        chatRoomIMGView.layer.borderWidth = 1
        chatRoomIMGView.layer.borderColor = UIColor.lightGray.cgColor
        chatRoomIMGView.layer.cornerRadius = 25
        chatRoomIMGView.contentMode = .scaleAspectFit
        
        chatRoomTitle.font = .boldSystemFont(ofSize: 15)
        recentMSG.font = .systemFont(ofSize: 13)
        recentDate.font = .boldSystemFont(ofSize: 12)
        recentDate.textColor = .lightGray
    }
    
    func configureCellData(data: ChatRoom) {
        chatRoomIMGView.image = UIImage(named: data.chatroomImage[0])
        chatRoomTitle.text = data.chatroomName
        recentMSG.text = data.chatList.last?.message
        
        guard let date = data.chatList.last?.date else {
            print(#function, "날짜 오류")
            return
        }
        recentDate.text = formatDate(date: date)
//        recentDate.text = "00.00.00"
    }
    
    // 날짜 포맷 함수 (yy.MM.dd)
    func formatDate(date originDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = dateFormatter.date(from: originDate) else {
            print(#function, "날짜 오류")
            return ""
        }
    
        dateFormatter.dateFormat = "yy.MM.dd"
        
        let formattedString = dateFormatter.string(from: date)
        return formattedString
    }
}
