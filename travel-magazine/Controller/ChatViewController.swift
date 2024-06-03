//
//  ChatRoomViewController.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

class ChatViewController: UIViewController {
    
    var chatData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle(chatData?.chatroomName ?? "손님")
        configureImageBarButton(title: nil, image: "chevron.left", target: self, action: #selector(popBarButtonClicked), type: .left)
    }
    

    @objc func popBarButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}
