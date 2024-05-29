//
//  PopularCityViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    
    @IBOutlet var popularCitySC: UISegmentedControl!
    
    let cityList = CityInfo().city

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("인기 도시")
        configureSegmentedControl()
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
    
}
