//
//  RestaurantMapViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/30/24.
//

import UIKit

class RestaurantMapViewController: UIViewController {
    
    var mapData: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 바 버튼 (뒤로가기)
        setPopBarButton()
        
        guard let mapData = mapData else { return }
        configureViewTitle(mapData.name)
        setRestaurantMapData(data: mapData)
    }
    
    func setRestaurantMapData(data: Restaurant) {
        print(data)
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
