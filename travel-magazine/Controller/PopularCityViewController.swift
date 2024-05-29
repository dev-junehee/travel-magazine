//
//  PopularCityViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var popularCitySC: UISegmentedControl!
    @IBOutlet var popularCityTableView: UITableView!
    
    let cityList = CityInfo().city
    
    let identifier = PopularCityTableViewCell.identifier

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("인기 도시")
        configureSegmentedControl()
        
        popularCityTableView.rowHeight = 140
        
        popularCityTableView.delegate = self
        popularCityTableView.dataSource = self
        
        let xib = UINib(nibName: identifier, bundle: nil)
        popularCityTableView.register(xib, forCellReuseIdentifier: identifier)
        
        // 테이블 뷰에서 셀과 셀 표시줄 삭제
        popularCityTableView.separatorStyle = .none
    }
    
    // segmented control 초기 설정
    func configureSegmentedControl() {
        popularCitySC.insertSegment(withTitle: "전체", at: 0, animated: true)
        popularCitySC.setTitle("국내", forSegmentAt: 1)
        popularCitySC.setTitle("해외", forSegmentAt: 2)
        popularCitySC.addTarget(self, action: #selector(popularCitySCClicked), for: .valueChanged)
    }
    
    // segmented control 클릭 핸들러
    @objc func popularCitySCClicked(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        
        switch idx {
        case 0:
            print("전체 선택")
            break
        case 1:
            print("국내 선택")
            break
        case 2:
            print("해외 선택")
            break
        default:
            print("예외처리-오류!")
            break
        }
    }
    
    // 섹션 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return cityList.count
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 100
//    }
//    
    // 셀 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cityList[indexPath.section]
        
        let cell = popularCityTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PopularCityTableViewCell
        
        cell.configureCellUI()
        cell.configureCellData(data: city)
        
        return cell
    }
    
    
}
