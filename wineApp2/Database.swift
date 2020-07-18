//
//  dataBase.swift
//  wineApp2
//
//  Created by stephanie on 7/11/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation

struct Database {
    
    static var likedNamesKey = "likedNamesKey"
    static var dislikedNamesKey = "dislikedNamesKey"
    
    
    func addLikedWine(name: String, isLiked: Bool) {
        let userDefaults = UserDefaults.standard
        var likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as? [String]) ?? [String]()
        
        let exists = Database.doesExist(name: name)
        
        //TODO delete:
        if exists == true {
            print("heyo!")
            print("liked wines list: \(userDefaults.array(forKey: Database.likedNamesKey) as Any)")
        }
        
        if exists == false {
            likedNames.append(name)

            userDefaults.set(likedNames, forKey: Database.likedNamesKey)
            userDefaults.synchronize()
            
            print("new wine added liked wines list: \(userDefaults.array(forKey: Database.likedNamesKey) as Any)")
        }
        
    }
    
    func addDislikedWine(name: String, isLiked: Bool) {
        let userDefaults = UserDefaults.standard
        var dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as? [String]) ?? [String]()
    
        let exists = Database.doesExist(name: name)

        //TODO delete:
        if exists == true {
            print("heyo!")
            print("disliked wines: \(userDefaults.array(forKey: Database.dislikedNamesKey) as Any)")
          }
        
        if exists == false {
            dislikedNames.append(name)
            
            userDefaults.set(dislikedNames, forKey: Database.dislikedNamesKey)
            userDefaults.synchronize()
            
            print("disliked wines: \(userDefaults.array(forKey: Database.dislikedNamesKey) as Any)")
        }

    }
    
    static func doesExist(name: String) -> Bool {
        let userDefaults = UserDefaults.standard
        let likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as? [String]) ?? [String]()
        let dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as? [String]) ?? [String]()

        for (index, wineName) in likedNames.enumerated() {
            if name == wineName {
//                preferences[index] = isLiked
                return true
            }
        }
                
        for (index, wineName) in dislikedNames.enumerated() {
            if name == wineName {
//                preferences[index] = isLiked
                return true
            }
        }
        
        return false
    }
    
    static func wasLiked(name: String) -> Bool {
            let userDefaults = UserDefaults.standard
            let likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as? [String]) ?? [String]()
           
            for (index, wineName) in likedNames.enumerated() {
                if name == wineName {
    //                preferences[index] = isLiked
                    return true
                }
            }
            
            return false
    }
    
    static func wasNotLiked(name: String) -> Bool {
            let userDefaults = UserDefaults.standard
            let dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as? [String]) ?? [String]()

            for (index, wineName) in dislikedNames.enumerated() {
                if name == wineName {
    //                preferences[index] = isLiked
                    return true
                }
            }
            
            return false
    }
    
    
    static func clearDB() {
        let userDefaults = UserDefaults.standard
        var likedArray = userDefaults.array(forKey: Database.likedNamesKey)
        var dislikedArray = userDefaults.array(forKey: Database.dislikedNamesKey)
        likedArray?.removeAll()
        dislikedArray?.removeAll()

        userDefaults.set(likedArray, forKey: Database.likedNamesKey)
        userDefaults.set(dislikedArray, forKey: Database.dislikedNamesKey)
        userDefaults.synchronize()
    }
    
    static func allLikedWines<T>() -> Array<T> {
        let userDefaults = UserDefaults.standard
        var likedArray = userDefaults.array(forKey: Database.likedNamesKey)

        return likedArray 

    }

    
    //end
}
