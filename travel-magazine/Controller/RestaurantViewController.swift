//
//  RestaurantViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    let UD = UserDefaultsManager()
    let identifier = RestaurantTableViewCell.identifier
    
    var originalRestaurantList: [Restaurant] = [] {
        didSet {
            RestaurantTableView.reloadData()
        }
    }
    
    var filteredRestaurantList: [Restaurant] = [] {
        didSet {
            RestaurantTableView.reloadData()
        }
    }
    
    @IBOutlet var RestaurantSearchBar: UISearchBar!
    @IBOutlet var RestaurantTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("맛집을 찾아요🍕")
        configureRestaurantTableView()
        configureRestaurantSearchBar()
        configureTextBarButton(title: "전체", style: .plain, target: self, action: #selector(allBarButtonClicked), direction: true)
        configureTextBarButton(title: "즐겨찾기", style: .plain, target: self, action: #selector(likeBarButtonClicked), direction: false)
    }
    
    // MARK: 초기 설정 함수
    // TableView 초기 설정
    func configureRestaurantTableView() {
        RestaurantTableView.delegate = self
        RestaurantTableView.dataSource = self
        
        let xib = UINib(nibName: identifier, bundle: nil)
        RestaurantTableView.register(xib, forCellReuseIdentifier: identifier)
     
        originalRestaurantList = RestaurantList().restaurantArray
        filteredRestaurantList = originalRestaurantList
        
        RestaurantTableView.rowHeight = 130
    }

    // SearchBar 초기 설정
    func configureRestaurantSearchBar() {
        RestaurantSearchBar.delegate = self
        RestaurantSearchBar.placeholder = "맛집 이름이나 카테고리를 검색해 보세요!"
    }
    
    // MARK: Base64 인코딩
//    enum OriginData {
//        case Magazine
//        case Restaurant
//        case Travel
//        case City
//    }
    
    // UserDefaults Base64 Encoding
//    func encodingArrayToBase64(data: Array<OriginData>, key: String) {
//        let encoder = JSONEncoder()
//        
//        if let encodedData = try? JSONEncoder().encode(data) {
//            UserDefaults.standard.set(encodedData, forKey: key)
//        }
//    }
    
    // MARK: 핸들러
    // TableView Cell - 즐겨찾기 버튼 클릭 핸들러
    @objc func likeButtonClicked(_ sender: UIButton) {
        let isLike = filteredRestaurantList[sender.tag].like
        
        if isLike {
            showAlertToUnlike()
        } else {
            showAlertToLike()
        }
        
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
    }
    
    // 즐겨찾기
    @objc func likeBarButtonClicked() {
        let likedList = originalRestaurantList.filter { $0.like }
        filteredRestaurantList = likedList
    }
    
    
    // 즐겨찾기 등록 & 해제 Alert
    // 추후 모듈화 & 핸들러 추가하기
    func showAlertToLike() {
        let alert = UIAlertController(title: "즐겨찾기를 등록하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func showAlertToUnlike() {
        let alert = UIAlertController(title: "즐겨찾기를 해제하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}


// MARK: Extension
// SearchBar Extension
extension RestaurantViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [Restaurant] = []
        
        guard let searchText = searchBar.text else {
            showAlert("검색어를 입력해 주세요!")
            return
        }
        
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            showAlert("1글자 이상의 검색어를 입력해 주세요!")
            return
        }
        
        for restaurant in originalRestaurantList {
            if restaurant.name.contains(searchText) || restaurant.category.contains(searchText) {
                searchList.append(restaurant)
            }
        }
        
        if searchList.isEmpty {
            showAlert("찾고있는 맛집이 없어요😰")
            return
        }
        
        filteredRestaurantList = searchList
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
