//
//  RestaurantViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    let identifier = RestaurantTableViewCell.identifier
    
    var originalRestaurantList: [Restaurant] = RestaurantList().restaurantArray
    
    var filteredRestaurantList: [Restaurant] = []
    
    @IBOutlet var RestaurantSearchBar: UISearchBar!
    @IBOutlet var RestaurantTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("맛집을 찾아요🍕")
        configureRestaurantTableView()
        configureRestaurantSearchBar()
        configureBarButton(title: "전체", style: .plain, target: self, action: #selector(allBarButtonClicked), direction: true)
        configureBarButton(title: "즐겨찾기", style: .plain, target: self, action: #selector(likeBarButtonClicked), direction: false)
    }
    
    // MARK: 초기 설정 함수
    // TableView 초기 설정
    func configureRestaurantTableView() {
        RestaurantTableView.delegate = self
        RestaurantTableView.dataSource = self
        
        let xib = UINib(nibName: identifier, bundle: nil)
        RestaurantTableView.register(xib, forCellReuseIdentifier: identifier)
        
        filteredRestaurantList = originalRestaurantList
        RestaurantTableView.rowHeight = 130
    }
    
    // SearchBar 초기 설정
    func configureRestaurantSearchBar() {
        RestaurantSearchBar.delegate = self
        RestaurantSearchBar.placeholder = "식당 이름이나 카테고리를 검색해 보세요!"
    }
    
    // MARK: 핸들러
    // TableView Cell - 즐겨찾기 버튼 클릭 핸들러
    @objc func likeButtonClicked(_ sender: UIButton) {
        filteredRestaurantList[sender.tag].like.toggle()
        
        for i in 0..<originalRestaurantList.count {
            if originalRestaurantList[i].name == filteredRestaurantList[sender.tag].name {
                originalRestaurantList[i].like.toggle()
            }
        }
        
        RestaurantTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    // BarButton - 필터링 버튼 클릭 핸들러
    // 전체보기
    @objc func allBarButtonClicked() {
        filteredRestaurantList = originalRestaurantList
        RestaurantTableView.reloadData()
    }
    
    // 즐겨찾기
    @objc func likeBarButtonClicked() {
        let likedList = filteredRestaurantList.filter { $0.like }
        filteredRestaurantList = likedList
        RestaurantTableView.reloadData()
    }
}


// MARK: Extension
// SearchBar Extension
extension RestaurantViewController: UISearchBarDelegate {
    // 서치바 클릭 핸들러
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [Restaurant] = []
        
        guard let searchText = searchBar.text else {
            showAlert("검색어를 입력해 주세요!")
            return
        }
        
        for restaurant in originalRestaurantList {
            if restaurant.name == searchText || restaurant.category == searchText {
                searchList.append(restaurant)
            }
        }
        
        filteredRestaurantList = searchList
        RestaurantTableView.reloadData()
        view.endEditing(true)
        searchBar.text = ""
    }
}

// TableView Extension
extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurantList.count
    }
    
    // 셀 데이터 & 디자인
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! RestaurantTableViewCell
        let restaurant = filteredRestaurantList[indexPath.row]
        
        cell.configureCellUI()
        cell.configureCellData(data: restaurant)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = filteredRestaurantList[indexPath.row]
        
        let sb = UIStoryboard(name: "RestaurantMap", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        
        vc.mapData = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
