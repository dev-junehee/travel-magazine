//
//  CityInfoViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var travelTableView: UITableView!
    
    var travelList = TravelInfo().travel
    
    let infoIdentifier = CityInfoTableViewCell.identifier
    let adIdentifier = CityAdTableViewCell.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewTitle("도시 상세 정보")
        
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let infoXib = UINib(nibName: infoIdentifier, bundle: nil)
        let adXib = UINib(nibName: adIdentifier, bundle: nil)
        travelTableView.register(infoXib, forCellReuseIdentifier: infoIdentifier)
        travelTableView.register(adXib, forCellReuseIdentifier: adIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelList[indexPath.row]
        
        // if 광고 셀인 경우
        // else 관광지 셀인 경우
        if travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: adIdentifier, for: indexPath) as! CityAdTableViewCell
            
            tableView.rowHeight = 100
            
            cell.configureCellUI()
            cell.configureCellData(data: travel)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: infoIdentifier, for: indexPath) as! CityInfoTableViewCell
            
            tableView.rowHeight = 130
            
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
        let cityAdDetailVC = "CityAdDetailViewController"
        
        let cityInfoDetail = "CityInfoDetail"
        let cityInfoDatailVC = "CityInfoDetailViewController"
        
        if travel.ad {
            // if 광고 셀인 경우 - present(modal) 아래에서 위로 fullScreen
            let sb = UIStoryboard(name: cityAdDetail, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: cityAdDetailVC) as! CityAdDetailViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        } else {
            // else 관광지 셀인 경우 - push(show) 옆으로 fullScreen
            let sb = UIStoryboard(name: cityInfoDetail, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: cityInfoDatailVC) as! CityInfoDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
            
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        guard let like = travelList[sender.tag].like else {
            print("도시 탭 - 하트 클릭 오류")
            return
        }
        travelList[sender.tag].like?.toggle()
        travelTableView.reloadData()
    }
    
}
