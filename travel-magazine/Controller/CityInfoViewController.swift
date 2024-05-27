//
//  CityInfoViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/27/24.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    
    let cityList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "도시 상세 정보"
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let infoXib = UINib(nibName: "CityInfoTableViewCell", bundle: nil)
        let adXib = UINib(nibName: "CityAdTableViewCell", bundle: nil)
        cityTableView.register(infoXib, forCellReuseIdentifier: "CityInfoTableViewCell")
        cityTableView.register(adXib, forCellReuseIdentifier: "CityAdTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cityList[indexPath.row]
        
        // if 광고 셀인 경우
        // else 관광지 셀인 경우
        if city.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityAdTableViewCell", for: indexPath) as! CityAdTableViewCell
            
            tableView.rowHeight = 100
            
            cell.configureCellUI()
            cell.configureCellData(data: city)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityInfoTableViewCell", for: indexPath) as! CityInfoTableViewCell
            
            tableView.rowHeight = 130
            
            cell.configureCellUI()
            cell.configureCellData(data: city)
            
            return cell
        }
    }
    
    
}
