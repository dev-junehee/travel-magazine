//
//  RestaurantViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var foodSearchBar: UISearchBar!
    @IBOutlet var foodTableView: UITableView!

    
    let restaurantList = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []
    
    let identifier = RestaurantTableViewCell.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewTitle("맛집을 찾아요🍕")
        
        let all = UIBarButtonItem(title: "전체", style: .plain, target: self, action: #selector(allBarButtonClicked))
        let like = UIBarButtonItem(title: "즐겨찾기", style: .plain, target: self, action: #selector(likeBarButtonClicked))
        
        navigationItem.leftBarButtonItem = all
        navigationItem.rightBarButtonItem = like
        
        all.tintColor = .systemGray
        like.tintColor = .systemGray
        
        // 테이블뷰 셀 height 크기
        foodTableView.rowHeight = 130
        
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        // 재사용 커스텀 셀(XIB) Register
        let xib = UINib(nibName: identifier, bundle: nil)
        foodTableView.register(xib, forCellReuseIdentifier: identifier)
        
        // 서치바
        foodSearchBar.delegate = self
        foodSearchBar.placeholder = "식당 이름이나 카테고리를 검색해 보세요!"
        
        // 첫 로드 시 전체 식당 데이터 보여주기
        filteredList = restaurantList
    }
    
    // 즐겨찾기 버튼 클릭 핸들러
    @objc func likeButtonClicked(_ sender: UIButton) {
        filteredList[sender.tag].like.toggle()
        foodTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    // 상단 바 버튼 클릭 핸들러
    // 전체보기
    @objc func allBarButtonClicked() {
        filteredList = restaurantList
        foodTableView.reloadData()
    }
    
    // 즐겨찾기
    @objc func likeBarButtonClicked() {
        let likedList = restaurantList.filter { $0.like }
        filteredList = likedList
        foodTableView.reloadData()
    }
    
    // 서치바 클릭 핸들러
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [Restaurant] = []
        
        guard let searchText = searchBar.text else {
            showAlert("검색어를 입력해 주세요!")
            return
        }
        
        for restaurant in restaurantList {
            if restaurant.name == searchText || restaurant.category == searchText {
                searchList.append(restaurant)
            }
        }
        
        filteredList = searchList
        foodTableView.reloadData()
        view.endEditing(true)
        searchBar.text = ""
    }

    // 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    // 셀 데이터 & 디자인
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! RestaurantTableViewCell
        let restaurant = filteredList[indexPath.row]
        
        cell.configureCellUI()
        cell.configureCellData(data: restaurant)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = filteredList[indexPath.row]
        
        let sb = UIStoryboard(name: "RestaurantMap", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        
        vc.mapData = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
        
}
