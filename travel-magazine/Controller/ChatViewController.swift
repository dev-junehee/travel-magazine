//
//  ChatRoomViewController.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

// 채팅방 내부 화면
class ChatViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    var chatData: ChatRoom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle(chatData.chatroomName)
        configureImageBarButton(title: nil, image: "chevron.left", target: self, action: #selector(popBarButtonClicked), type: .left)
        
        configureTableView()
    }
    
    func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        chatTableView.separatorStyle = .none
        
        let xib = UINib(nibName: ChatTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: ChatTableViewCell.identifier)
        
        let myXib = UINib(nibName: myChatTableViewCell.identifier, bundle: nil)
        chatTableView.register(myXib, forCellReuseIdentifier: myChatTableViewCell.identifier)
        
    }

    @objc func popBarButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}


extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let chat = chatData.chatList[idx]

        if chat.user == User.user {
            print("")
            let cell = tableView.dequeueReusableCell(withIdentifier: myChatTableViewCell.identifier, for: indexPath) as! myChatTableViewCell
            
            cell.selectionStyle = .none
            cell.configureCellUI()
            cell.configureCellData(data: chat)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as! ChatTableViewCell
            
            cell.selectionStyle = .none
            cell.configureCellUI()
            cell.configureCellData(data: chat)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


