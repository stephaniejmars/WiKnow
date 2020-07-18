//
//  myFavsViewController.swift
//  wineApp2
//
//  Created by stephanie on 7/18/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

class MyFavsViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
        

    override func viewDidLoad() {
          super.viewDidLoad()
          setupTableView()
      }
    
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    func setupTableView() {
//        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(WineCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns 10 cells
        return 10
        // let cellCount = Database liked items length?
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WineCell
        cell.backgroundColor = UIColor.white
//        cell.wineLabel.text = "Day \(indexPath.row+1)"
        //change to wine names
        let likedWines = Database.allLikedWines()
//        cell.lblBankPayment.text = "(BRIArray[indexPath.row])"
        cell.wineLabel.text = "\(likedWines[indexPath.row])"
        return cell
    }
    
    
}
