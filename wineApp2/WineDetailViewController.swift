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

    @IBAction func dislikePressed(_ sender: Any) {
        //call db function
        //addWine(name: "\(wine.name)", isLiked: false)
        //send alert to screen preference has been saved
    }
    
    @IBAction func likePressed(_ sender: Any) {
        //call db function
        //addWine(name: String, isLiked: true)
        //send alert to screen that it has been saved
    }
    
    func updateForWine() {
        nameLabel.text = wine?.product_name
        brandLabel.text = wine?.brand
        imageView.image = wine?.image
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateForWine()

    }

}
