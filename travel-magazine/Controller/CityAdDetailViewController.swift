//
//  CityAdDetailViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/29/24.
//

import UIKit

class CityAdDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewTitle("광고 화면")
        setExitBarButton()
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
