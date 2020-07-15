//
//  DislikeButton.swift
//  wineApp2
//
//  Created by stephanie on 7/14/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

class DislikeButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setShadow()
        styleButton()
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    private func styleButton() {
//        setTitleColor(.white, for: .normal)
//        titleLabel?.font = UIFont(name: "Geeza Pro", size: 18)
//        setTitle("Dislike", for: .normal)
        layer.cornerRadius = 25
//        layer.borderWidth = 3.0
//        layer.borderColor = UIColor.darkGray.cgColor
//        backgroundColor = UIColor(red: 161/255, green: 103/255, blue: 103/255, alpha: 1)
        backgroundColor = UIColor.purple
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [#colorLiteral(red: 173/255, green: 7/255, blue: 7/255, alpha: 1).cgColor, #colorLiteral(red: 161/255, green: 103/255, blue: 103/255, alpha: 1).cgColor]
//        layer.addSublayer(gradientLayer)
    }
    
}


//***************************
        
//        (red: 173/255, green: 7/255, blue: 7/255)
//        (red: 161/255, green: 103/255, blue: 103/255)
//        startPoint: .topLeading, endPoint: .bottomTrailing))
        //*********************************
//let gradientLayer = CAGradientLayer()
//    gradientLayer.colors = [#colorLiteral(red: 173/255, green: 7/255, blue: 7/255, alpha: 1).cgColor, #colorLiteral(red: 161/255, green: 103/255, blue: 103/255, alpha: 1).cgColor]


        // Set the size of the layer to be equal to size of the display.
//        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
       
        //#colorLiteral(red: ...)
//        gradientLayer.colors = [#colorLiteral(red: 173/255, green: 7/255, blue: 7/255, alpha: 1).cgColor, #colorLiteral(red: 161/255, green: 103/255, blue: 103/255, alpha: 1).cgColor]

        // Rasterize this static layer to improve app performance.
//        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
//        LikeButton.layer.addSublayer(gradientLayer)
        //*******************
