//
//  HomeButtons.swift
//  wineApp2
//
//  Created by stephanie on 7/15/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

class HomeButtons: UIButton {
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
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Trebuchet MS", size: 30)
        layer.cornerRadius = 25
        backgroundColor = UIColor.purple
    }
}
