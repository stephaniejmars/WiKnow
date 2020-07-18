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

    @IBOutlet weak var preferenceLabel: UILabel!
    @IBOutlet weak var preferenceIcon: UIImageView!

    
    @IBAction func dislikePressed(_ sender: Any) {
        //call db function
        let dB = Database()
        dB.addDislikedWine(name: "\(String(describing: wine?.product_name))", isLiked: false)
        
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
        dB.addLikedWine(name: "\(String(describing: wine?.product_name))", isLiked: true)
        
        //send alert to screen that it has been saved
        let confirmationLike = UIAlertController(title: "Yay!", message: "Your preference has been saved.", preferredStyle: .alert)
            
        let ok = UIAlertAction(title: "Awesome", style: .default) { (action) -> Void in
            print("likebutton tapped")
        }
        
        confirmationLike.addAction(ok)
        self.present(confirmationLike, animated: true, completion: nil)
    }
    
    
    
    func updateForWine() {
        let prevLiked = Database.wasLiked(name: "\(wine?.product_name)")
        let prevDisliked = Database.wasNotLiked(name: "\(wine?.product_name)")
        let heartImage = UIImage(systemName: "suit.heart.fill")
        let xImage = UIImage(systemName: "xmark")

        
        if prevLiked == true {
            preferenceIcon.image = heartImage
            preferenceLabel.text = "You have tried this wine and liked it! :) "
            preferenceLabel.textColor = UIColor(red: 40.00/255.00, green: 174.00/255.00, blue: 96.00/255.00, alpha: 1)
        } else if prevDisliked == true {
            preferenceIcon.image = xImage
            preferenceLabel.text = "You have tried this wine and did not like it :( "
            preferenceLabel.textColor = UIColor(ciColor: .red)
        } else {
            brandLabel.text = wine?.brand
        }
        
//        preferenceIcon.layer.cornerRadius = preferenceIcon.frame.size.width / 2
//        preferenceIcon.clipsToBounds = true
        
        nameLabel.text = wine?.product_name
        imageView.image = wine?.image
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateForWine()
    }

}
