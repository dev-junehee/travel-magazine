//
//  CityInfoViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class CityInfoViewController: UIViewController {

    var travelList = TravelInfo().travel
    
    let infoIdentifier = CityInfoTableViewCell.identifier
    let adIdentifier = CityAdTableViewCell.identifier
    
    @IBOutlet var travelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewTitle("도시 상세 정보📍")
        configureTravelTableView()
    }
    
    // TableView 초기 설정
    func configureTravelTableView() {
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let infoXib = UINib(nibName: infoIdentifier, bundle: nil)
        let adXib = UINib(nibName: adIdentifier, bundle: nil)
        travelTableView.register(infoXib, forCellReuseIdentifier: infoIdentifier)
        travelTableView.register(adXib, forCellReuseIdentifier: adIdentifier)
        
        travelTableView.rowHeight = 120
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        let idx = sender.tag
        travelList[idx].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
}

// MARK: Extension
extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelList[indexPath.row]
        
        // if 광고 셀인 경우
        // else 관광지 셀인 경우
        if travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: adIdentifier, for: indexPath) as! CityAdTableViewCell
            
            cell.configureCellUI()
            cell.configureCellData(data: travel)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: infoIdentifier, for: indexPath) as! CityInfoTableViewCell
            
            cell.configureCellUI()
            cell.configureCellData(data: travel)
 
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travelList[indexPath.row]
       
        let cityAdDetail = "CityAdDetail"
        let cityAdDetailVC = CityAdDetailViewController.identifier
        
        let cityInfoDetail = "CityInfoDetail"
        let cityInfoDatailVC = CityInfoDetailViewController.identifier
        
        if travel.ad {
            // if 광고 셀인 경우 - present(modal) 아래에서 위로 fullScreen
            let sb = UIStoryboard(name: cityAdDetail, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: cityAdDetailVC) as! CityAdDetailViewController

            vc.titleData = travel.title  // 광고 텍스트만 전달
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        } else {
            // else 관광지 셀인 경우 - push(show) 옆으로 fullScreen
            let sb = UIStoryboard(name: cityInfoDetail, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: cityInfoDatailVC) as! CityInfoDetailViewController
            
            vc.detailData = travel  // 데이터 전체 전달
            
            navigationController?.pushViewController(vc, animated: true)
        }
            
    }
}
