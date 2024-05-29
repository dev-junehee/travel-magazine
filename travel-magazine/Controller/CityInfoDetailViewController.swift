//
//  CityInfoDetailViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class CityInfoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("관광지 화면")
        setPopBarButton()
    }

    func setPopBarButton() {
        let popImage = UIImage(systemName: "chevron.left")
        let popButton = UIBarButtonItem(title: nil, image: popImage, target: self, action: #selector(popBarButtonClicked))
        navigationItem.leftBarButtonItem = popButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func popBarButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
