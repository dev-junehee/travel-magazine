//
//  PopularCityViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var popularCitySearchBar: UISearchBar!
    @IBOutlet var popularCitySC: UISegmentedControl!
    @IBOutlet var popularCityTableView: UITableView!
    
    let cityList = CityInfo().city
    
    var filteredList: [City] = [] {
        didSet {
            popularCityTableView.reloadData()
        }
    }
    
    let identifier = PopularCityTableViewCell.identifier

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle(Common.Title.popularCity)
        
        configurePopularCitySearchBar()
        configurePopularCityTableView()
        configureSegmentedControl()

        filteredList = cityList
    }
    
    // TableView 초기 설정
    func configurePopularCityTableView() {
        popularCityTableView.delegate = self
        popularCityTableView.dataSource = self
        
        let xib = UINib(nibName: identifier, bundle: nil)
        popularCityTableView.register(xib, forCellReuseIdentifier: identifier)
        
        // 테이블 뷰에서 셀과 셀 표시줄 삭제
        popularCityTableView.separatorStyle = .none
        popularCityTableView.keyboardDismissMode = .onDrag
        
        popularCityTableView.rowHeight = 140
    }
    
    // SearchBar 초기 설정
    func configurePopularCitySearchBar() {
        popularCitySearchBar.delegate = self
        popularCitySearchBar.placeholder = Common.Placeholder.searchCity
    }
    
    // Segmented Control 초기 설정
    func configureSegmentedControl() {
        popularCitySC.insertSegment(withTitle: Common.Button.all, at: 0, animated: true)
        popularCitySC.setTitle(Common.Button.domestic, forSegmentAt: 1)
        popularCitySC.setTitle(Common.Button.abroad, forSegmentAt: 2)
        popularCitySC.addTarget(self, action: #selector(popularCitySCClicked), for: .valueChanged)
        popularCitySC.selectedSegmentIndex = 0  // 0번째로 고정
    }
    
    // Segmented Control 클릭 핸들러
    @objc func popularCitySCClicked(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        
        switch idx {
        case 0:
            filteredList = cityList
            break
        case 1:
            filteredList = cityList.filter { $0.domestic_travel }
            break
        case 2:
            filteredList = cityList.filter { !$0.domestic_travel }
            break
        default:
            showAlert(Common.Alert.invalidCategory)
            break
        }
    }
    
    // SearchBar 클릭 핸들러
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        let segmentIdx = popularCitySC.selectedSegmentIndex
        
        if searchText.isEmpty || (searchText.trimmingCharacters(in: .whitespacesAndNewlines).count == 0) {
            showAlert(Common.Alert.noSearchText)
            return
        }
        
        if segmentIdx == 0 {
            filteredList = cityList.filter { $0.city_name.contains(searchText) || $0.city_explain.contains(searchText)}
        } else if segmentIdx == 1 {
            filteredList = cityList.filter { $0.domestic_travel && $0.city_name.contains(searchText) }
        } else if segmentIdx == 2 {
            filteredList = cityList.filter { !$0.domestic_travel && $0.city_name.contains(searchText) }
        } else {
            showAlert(Common.Alert.invalidSearchText)
        }
        view.endEditing(true)
    }
    
    // 검색 후 서치 바 다시 누를 때 기존 검색어 초기화
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}


extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        if filteredList.count == 0 {
            showAlert(Common.Alert.noResult)
            return 0
        }
        return filteredList.count
    }
    
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = filteredList[indexPath.section]
        
        let cell = popularCityTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PopularCityTableViewCell
        
        cell.configureCellUI()
        cell.configureCellData(data: city)
        cell.selectionStyle = .none
        
        return cell
    }
}
