//
//  dataBase.swift
//  wineApp2
//
//  Created by stephanie on 7/11/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation

struct Database {
    
    static let likedNamesKey = "likedNamesKey"
    static let dislikedNamesKey = "dislikedNamesKey"
    
    
    func addLikedWine(name: String, isLiked: Bool) {
        let userDefaults = UserDefaults.standard
        var likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as? [String]) ?? [String]()

        var matchFound = false
        
        for (index, wineName) in likedNames.enumerated() {
            if name == wineName {
//                preferences[index] = isLiked
                matchFound = true
                print("duplicate found but liked wines list is this: \(userDefaults.array(forKey: Database.likedNamesKey) as Any)")
                return
            }
        }
        
        if matchFound == false {
            likedNames.append(name)

            userDefaults.set(likedNames, forKey: Database.likedNamesKey)
            userDefaults.synchronize()
            
            print("new wine added liked wines list: \(userDefaults.array(forKey: Database.likedNamesKey) as Any)")
        }
        
    }
    
    func addDislikedWine(name: String, isLiked: Bool) {
        let userDefaults = UserDefaults.standard
        var dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as? [String]) ?? [String]()
    
        var matchFound = false
        
        for (index, wineName) in dislikedNames.enumerated() {
            if name == wineName {
//                preferences[index] = isLiked
                matchFound = true
                print("duplicate found but disliked wines list is this: \(userDefaults.array(forKey: Database.dislikedNamesKey) as Any)")
            }
        }
        
        if matchFound == false {
            dislikedNames.append(name)
            
            userDefaults.set(dislikedNames, forKey: Database.dislikedNamesKey)
            userDefaults.synchronize()
            
            print("disliked wines: \(userDefaults.array(forKey: Database.dislikedNamesKey) as Any)")
        }

    }
    
    func doesExist(){
        
//        var matchFound = false
//
//        for (index, wineName) in names.enumerated() {
//            if name == wineName {
//                preferences[index] = isLiked
//                matchFound = true
//            }
//        }
        
//        if matchFound == false {
//            names.append(name)
//            preferences.append(isLiked)
//        }
    }
}
