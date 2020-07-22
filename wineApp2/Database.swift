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
        var likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as! [String])// ?? [String]()
        var dislikedArray = userDefaults.array(forKey: Database.dislikedNamesKey)
        
        let exists = Database.doesExist(name: name)
        let wasNotLiked = Database.wasNotLiked(name: name)
        
        if wasNotLiked == true {
            if let index = dislikedArray?.index(where: {$0 as! String == name}) {
                           dislikedArray?.remove(at: index)
            }
            print("liked wines list: \(userDefaults.array(forKey: Database.likedNamesKey) as Any)")
                
            likedNames.append(name)
            userDefaults.set(likedNames, forKey: Database.likedNamesKey)
            userDefaults.set(dislikedArray, forKey: Database.dislikedNamesKey)
            userDefaults.synchronize()
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
        var dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as! [String])// ?? [String]()
        var likedArray = userDefaults.array(forKey: Database.likedNamesKey)
        
        let exists = Database.doesExist(name: name)
        let wasLiked = Database.wasLiked(name: name)

        if wasLiked == true {
    
            if let index = likedArray?.index(where: {$0 as! String == name}) {
                likedArray?.remove(at: index)
            }

            print("liked wines: \(likedArray)")
            print("disliked wines: \(dislikedNames)")
            
            dislikedNames.append(name)
            userDefaults.set(likedArray, forKey: Database.likedNamesKey)
            userDefaults.set(dislikedNames, forKey: Database.dislikedNamesKey)
            userDefaults.synchronize()
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
        let likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as! [String])// ?? [String]()
        let dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as! [String])// ?? [String]()

        for (_, wineName) in likedNames.enumerated() {
            if name == wineName {
                return true
            }
        }
                
        for (_, wineName) in dislikedNames.enumerated() {
            if name == wineName {
                return true
            }
        }
        
        return false
    }
    
    static func wasLiked(name: String) -> Bool {
            let userDefaults = UserDefaults.standard
            let likedNames = (userDefaults.array(forKey: Database.likedNamesKey) as! [String])// ?? [String]()
           
            for (_, wineName) in likedNames.enumerated() {
                if name == wineName {
                    return true
                }
            }
            
            return false
    }
    
    static func wasNotLiked(name: String) -> Bool {
            let userDefaults = UserDefaults.standard
            let dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as! [String])// ?? [String]()

            for (_, wineName) in dislikedNames.enumerated() {
                if name == wineName {
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
    
    static func allLikedWines() -> [String] {
        let userDefaults = UserDefaults.standard
        let likedArray = userDefaults.array(forKey: Database.likedNamesKey)
        
        return likedArray as! [String]

    }
    
    static func allDislikedWines() -> [String] {
        let userDefaults = UserDefaults.standard
        let dislikedArray = userDefaults.array(forKey: Database.dislikedNamesKey)
        return dislikedArray as! [String]
    }

    static func remove(wine: String) {
        
        let userDefaults = UserDefaults.standard
        var dislikedNames = (userDefaults.array(forKey: Database.dislikedNamesKey) as! [String])// ?? [String]()
        var likedArray = (userDefaults.array(forKey: Database.likedNamesKey) as! [String])// ?? [String]()
        if let index = likedArray.index(where: {$0 as! String == wine}) {
            likedArray.remove(at: index)
        }
        if let index = dislikedNames.index(where: {$0 as! String == wine}) {
            dislikedNames.remove(at: index)
        }
        userDefaults.set(likedArray, forKey: Database.likedNamesKey)
        userDefaults.set(dislikedNames, forKey: Database.dislikedNamesKey)
        userDefaults.synchronize()
    }
    //end
}

