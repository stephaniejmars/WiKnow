//
//  WineCell.swift
//  wineApp2
//
//  Created by stephanie on 7/18/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

class WineCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let wineLabel: UILabel = {
        let label = UILabel()
//        label.text = "Day 1"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(wineLabel)
        self.selectionStyle = .none
            
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
//        wineLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        wineLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        wineLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        wineLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 5).isActive = true
        wineLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -2).isActive = true
        
    }
    
        
    
}
