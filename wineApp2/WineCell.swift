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
    
    let pink = UIColor(red: 250.00/255.00, green: 204.00/255.00, blue: 197.00/255.00, alpha: 1)
    let lavender = UIColor(red: 189.00/255.00, green: 160.00/255.00, blue: 189.00/255.00, alpha: 1)
    
    var isFav: Bool = false {
        
        didSet {
            cellView.backgroundColor = isFav ? .purple : lavender
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
//        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let wineLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Trebuchet MS", size: 16)
        label.textAlignment = NSTextAlignment.center
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
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        wineLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        wineLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 5).isActive = true
        wineLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -2).isActive = true
        
    }
    
        
    
}
