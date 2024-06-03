//
//  TravelTalkViewController.swift
//  travel-magazine
//
//  Created by junehee on 6/3/24.
//

import UIKit

class TravelTalkViewController: UIViewController {
    
    @IBOutlet var talkSearchBar: UISearchBar!
    
//    let chatRoomList: [ChatRoom] = []
//    let fileredList: [ChatRoom] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewTitle(Common.Title.talk)
        configureTalkSearchBar()
    }
    
    func configureTalkSearchBar() {
        talkSearchBar.delegate = self
        talkSearchBar.placeholder = Common.Placeholder.searchTalk
    }
   

}

// MARK: Extendion 익스텐션
// SearchBar Extension
extension TravelTalkViewController: UISearchBarDelegate {
    func [ChatRoom] = [](_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
