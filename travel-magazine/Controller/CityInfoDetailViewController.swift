//
//  CityInfoDetailViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit
import Kingfisher

class CityInfoDetailViewController: UIViewController {
    
    var detailData: Travel?
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailDescriptionLabel: UILabel!
    @IBOutlet var detailGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageBarButton(title: nil, image: "chevron.left", target: self, action: #selector(popBarButtonClicked), direction: true)
        
        guard let detailData = detailData else {
            showAlert("데이터가 올바르지 않아요!")
            return
        }
        setTravelInfoDetail(data: detailData)
    }
    
    
    func setTravelInfoDetail(data: Travel) {
        configureViewTitle(data.title)
        
        // 이미지
        let imageURL = URL(string: data.travel_image!)
        let placeholder = UIImage(systemName: "arrow.down.circle.dotted")
        detailImageView.kf.setImage(with: imageURL, placeholder: placeholder)
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.layer.cornerRadius = 10
        // 설명
        detailDescriptionLabel.text = " \(data.description!) "
        detailDescriptionLabel.textAlignment = .center
        detailDescriptionLabel.font = Fonts.title18
        // 별점
        detailGradeLabel.text = convertGradeToStar(grade: data.grade!)
        detailGradeLabel.textAlignment = .center
        detailGradeLabel.font = .systemFont(ofSize: 30)
    }
    
    @objc func popBarButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    // 별점 출력 로직 수정하기!
    func convertGradeToStar(grade: Double) -> String {
        let intGrade = Int(grade)
        let stars = ["⭐️", "⭐️⭐️", "⭐️⭐️⭐️","⭐️⭐️⭐️⭐️","⭐️⭐️⭐️⭐️⭐️",]
        
        return stars[intGrade - 1]
    }
}
