//
//  UserDefaultsManager.swift
//  travel-magazine
//
//  Created by junehee on 5/31/24.
//

import Foundation

class UserDefaultsManager {
    // 맛집 탭
    var restaurantList: [Restaurant] {
        get {
            return UserDefaults.standard.array(forKey: "restaurant") as! [Restaurant]
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "restaurant")
        }
    }
}


