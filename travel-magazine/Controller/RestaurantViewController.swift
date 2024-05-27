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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "맛집을 찾아요"
        
        foodTableView.rowHeight = 130
        
        // UIView -> UITableView
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        // 재사용 커스텀 셀(XIB) Register
        let xib = UINib(nibName: "RestaurantTableViewCell", bundle: nil)
        foodTableView.register(xib, forCellReuseIdentifier: "RestaurantTableViewCell")
        
        // 서치바
        foodSearchBar.delegate = self
        
        // 첫 로드 시 전체 식당 데이터 보여주기
        filteredList = restaurantList
    }

    // 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    // 셀 데이터 & 디자인
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as! RestaurantTableViewCell
        let restaurant = filteredList[indexPath.row]
        
        cell.configureCellUI()
        cell.configureCellData(data: restaurant)
        
        return cell
    }
    
}
