//
//  CityAdDetailViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class CityAdDetailViewController: UIViewController {
    
    var titleData: String?
    
    @IBOutlet var detailAdView: UIView!
    @IBOutlet var detailAdLabel: UILabel!
    @IBOutlet var detailAdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("광고")
        setExitBarButton()
        
        guard let titleData = titleData else { return }
        setTravelAdDetail(title: titleData)
    }
    
    func setTravelAdDetail(title: String) {
        detailAdView.backgroundColor = .systemGray6
        
        detailAdLabel.text = title
        detailAdLabel.textAlignment = .center
        detailAdLabel.numberOfLines = 0
        detailAdLabel.font = .boldSystemFont(ofSize: 24)
        
        detailAdImageView.image = UIImage(systemName: "heart.fill")
        detailAdImageView.tintColor = .systemPink
    }
    
    func setExitBarButton() {
        let exitImage = UIImage(systemName: "xmark")
        let exitButton = UIBarButtonItem(title: nil, image: exitImage, target: self, action: #selector(exitButtontapped))
        navigationItem.leftBarButtonItem = exitButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func exitButtontapped() {
        dismiss(animated: true)
    }
    
    

}
