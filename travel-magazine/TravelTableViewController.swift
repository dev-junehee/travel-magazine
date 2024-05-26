//
//  TravelTableViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/26/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let magazineInfo = MagazineInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as! TravelTableViewCell
        let magazine = magazineInfo.magazine[indexPath.row]
        
        // 매거진 셀 메인 이미지
        let imageURL = URL(string: magazine.photo_image)
        cell.mainImage.kf.setImage(with: imageURL)
        cell.mainImage.contentMode = .scaleAspectFill
        cell.mainImage.layer.cornerRadius = 10
        
        // 매거진 셀 메인 타이틀
        cell.mainTitle.text = magazine.title
        cell.mainTitle.font = .systemFont(ofSize: 20, weight: .bold)
        cell.mainTitle.numberOfLines = 0
        
        // 매거진 셀 서브 타이블
        cell.subTitle.text = magazine.subtitle
        cell.subTitle.font = .systemFont(ofSize: 14, weight: .medium)
        cell.subTitle.textColor = .systemGray
        cell.subTitle.numberOfLines = 0
        
        // 매거진 셀 날짜 레이블
        let date = formatDate(date: magazine.date)
        cell.dateLabel.text = date
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.textColor = .systemGray
        cell.dateLabel.font = .systemFont(ofSize: 12, weight: .medium)
        
        return cell
    }

    func formatDate(date originDate: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyMMdd"
            
            guard let date = dateFormatter.date(from: originDate) else {
                print("오류")
                return ""
            }
        
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            
            let formattedString = dateFormatter.string(from: date)
            return formattedString
    }
}
