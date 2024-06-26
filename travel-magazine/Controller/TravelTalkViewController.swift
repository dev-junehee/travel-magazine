//
//  TravelTalkViewController.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

// 트래블톡 메인 화면
class TravelTalkViewController: UIViewController {
    
    @IBOutlet var talkSearchBar: UISearchBar!
    @IBOutlet var talkTableView: UITableView!
    
    var chatRoomList: [ChatRoom] = chatRoomData
    var fileredList: [ChatRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewTitle(Common.Title.talk)
        configureTalkSearchBar()
        configureTalkTableView()
        
        talkTableView.rowHeight = 85
        
        fileredList = chatRoomList
    }
    
    func configureTalkSearchBar() {
        talkSearchBar.delegate = self
        talkSearchBar.placeholder = Common.Placeholder.searchTalk
    }
    
    func configureTalkTableView() {
        talkTableView.delegate = self
        talkTableView.dataSource = self
        
        talkTableView.separatorStyle = .none
        let xib = UINib(nibName: ChatRoomTableViewCell.identifier, bundle: nil)
        talkTableView.register(xib, forCellReuseIdentifier: ChatRoomTableViewCell.identifier)
    }
   

}

// MARK: Extendion 익스텐션
// SearchBar Extension
extension TravelTalkViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

// TableView Extension
extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let chatRoom = chatRoomList[idx]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatRoomTableViewCell.identifier, for: indexPath) as! ChatRoomTableViewCell
        
        cell.selectionStyle = .none
        
        cell.configureCellUI()
        cell.configureCellData(data: chatRoom)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.row
        let chatRoom = chatRoomList[idx]
        
        let sb = UIStoryboard(name: StoryboardName.chatRoom, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ChatViewController.identifier) as! ChatViewController
        
        vc.chatData = chatRoom
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
