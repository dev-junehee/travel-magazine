//
//  RestaurantMapViewController.swift
//  travel-magazine
//
//  Created by junehee on 5/30/24.
//

import UIKit
import MapKit
import Kingfisher

class RestaurantMapViewController: UIViewController {
    
    var mapData: Restaurant?
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantAddressLabel: UILabel!
    @IBOutlet var restaurantPhoneLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var restaurantMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 바 버튼 (뒤로가기)
        setPopBarButton()
        
        guard let mapData = mapData else { return }
        configureViewTitle(mapData.name)
        setRestaurantMapData(data: mapData)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        restaurantImageView.layer.cornerRadius = restaurantImageView.frame.width / 2
    }
    
    func setRestaurantMapData(data: Restaurant) {
        // 식당 이미지
        let imageURL = URL(string: data.image)
        let placeholder = UIImage(systemName: "fork.knife.circle")
        restaurantImageView.kf.setImage(with: imageURL, placeholder: placeholder)
        restaurantImageView.contentMode = .scaleAspectFill
        
        // 좋아요 버튼
        let heart = data.like ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(heart, for: .normal)
        likeButton.tintColor = Colors.pink
        
        // 식당 주소&연락처 표시
        restaurantAddressLabel.text = data.address
        restaurantAddressLabel.font = Fonts.title14
        restaurantPhoneLabel.text = data.phoneNumber
        restaurantPhoneLabel.font = Fonts.subTitle14
        
        // 식당 위치 표시 (지도)
        let center = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
        restaurantMapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)
        
        // 식당 위치 어노테이션
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = data.name
        restaurantMapView.addAnnotation(annotation)
    }
    
    func setPopBarButton() {
        let popImage = UIImage(systemName: "chevron.left")
        let popButton = UIBarButtonItem(title: nil, image: popImage, target: self, action: #selector(popBarButtonClicked))
        navigationItem.leftBarButtonItem = popButton
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
    }
    
    @objc func popBarButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}
