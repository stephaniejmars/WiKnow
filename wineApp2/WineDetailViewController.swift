//
//  WineDetailViewController.swift
//  wineApp2
//
//  Created by stephanie on 7/13/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import UIKit

class WineDetailViewController: UIViewController {

    var wine:Wine? {
        didSet {
            if nameLabel == nil {
                return
            }
        updateForWine()
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    // could add label if wine exists in db with like
    // add label if wine exists in db with dislike
    
    //compare (wine?.product_name) with db
    
    @IBAction func dislikePressed(_ sender: Any) {
        //call db function
        let dB = Database()
        dB.addWine(name: "\(wine?.product_name)", isLiked: false)
        
        //send alert to screen preference has been saved
        let confirmationDislike = UIAlertController(title: ":(", message: "Sorry you didn't like it, your preference has been saved", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Cool", style: .default) { (action) -> Void in
            print("dislikebutton tapped")
        }
        
        confirmationDislike.addAction(ok)
        self.present(confirmationDislike, animated: true, completion: nil)
    }
    
    @IBAction func likePressed(_ sender: Any) {
        //call db function
        let dB = Database()
        dB.addWine(name: "\(wine?.product_name)", isLiked: true)
        //send alert to screen that it has been saved
        let confirmationLike = UIAlertController(title: "Yay!", message: "Your preference has been saved.", preferredStyle: .alert)
            
        let ok = UIAlertAction(title: "Awesome", style: .default) { (action) -> Void in
            print("likebutton tapped")
        }
        
        confirmationLike.addAction(ok)
        self.present(confirmationLike, animated: true, completion: nil)
    }
    
    func updateForWine() {
//        var stringName = Database.namesKey
//        var preference = Database.preferenceKey
//
//        let userDefaults = UserDefaults.standard
//        var names = (userDefaults.array(forKey: Database.namesKey) as? [String]) ?? [String]()
//        var preferences = (userDefaults.array(forKey: Database.preferenceKey)) as? [Bool] ?? [Bool]()
//        var matchFound = false
//
//        for (index, wineName) in names.enumerated() {
//            if wine?.product_name == wineName {
//
////                preferences[index] = isLiked
////                matchFound = true
//            }
//        }
        
        nameLabel.text = wine?.product_name
        brandLabel.text = wine?.brand
        imageView.image = wine?.image
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateForWine()

    }

}
