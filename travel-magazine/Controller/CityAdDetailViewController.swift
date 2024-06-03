//
//  CityAdDetailViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class CityAdDetailViewController: UIViewController {
    
    var adData: Travel?
    
    @IBOutlet var detailAdView: UIView!
    @IBOutlet var detailAdLabel: UILabel!
    @IBOutlet var detailAdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle(Common.Title.ad)
        configureImageBarButton(title: nil, image: "xmark", target: self, action: #selector(exitButtontapped), type: .left)
        
        guard let adData = adData else { return }
        setTravelAdDetail(title: adData.title)
//        view.backgroundColor = adData.bgColor
    }
    
    func setTravelAdDetail(title: String) {
        detailAdView.backgroundColor = adData?.bgColor
        
        detailAdLabel.text = title
        detailAdLabel.textAlignment = .center
        detailAdLabel.numberOfLines = 0
        detailAdLabel.font = .boldSystemFont(ofSize: 24)
        
        detailAdImageView.image = UIImage(systemName: "heart.fill")
        detailAdImageView.tintColor = Colors.pink
    }
    
    @objc func exitButtontapped() {
        dismiss(animated: true)
    }
    
    

}
