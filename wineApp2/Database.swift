//
//  dataBase.swift
//  wineApp2
//
//  Created by stephanie on 7/11/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation

struct Database {
    
    fileprivate static let namesKey = "namesKey"
    fileprivate static let preferenceKey = "preferenceKey"
    
    
    func addWine(name: String, isLiked: Bool) {
        let userDefaults = UserDefaults.standard
        var names = (userDefaults.array(forKey: Database.namesKey) as? [String]) ?? [String]()
        var preferences = (userDefaults.array(forKey: Database.preferenceKey)) as? [Bool] ?? [Bool]()
        var matchFound = false
        
        for (index, wineName) in names.enumerated() {
            if name == wineName {
                preferences[index] = isLiked
                matchFound = true
            }
        }
        
        if matchFound == false {
            names.append(name)
            preferences.append(isLiked)
        }
        
        userDefaults.set(names, forKey: Database.namesKey)
        userDefaults.set(preferences, forKey: Database.preferenceKey)
        userDefaults.synchronize()
    }
    

}
