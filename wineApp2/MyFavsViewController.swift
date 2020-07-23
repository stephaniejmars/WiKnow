//
//  myFavsViewController.swift
//  wineApp2
//
//  Created by stephanie on 7/18/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

class WineListController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    fileprivate var isFetchingWineDetails = false
    
    let showFavs: Bool
    var wines: [String]
    
    @objc func goHome(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    init(showFavs: Bool) {
        self.showFavs = showFavs
        if showFavs {
            self.wines = Database.allLikedWines()
        } else {
            self.wines = Database.allLikedWines() + Database.allDislikedWines()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .done, target: self, action: #selector(self.goHome))
        view.backgroundColor = .white
        setupTableView()
        setUpLayout()
        clearPreferences.addTarget(self, action: #selector(clearDB), for: .touchUpInside)
    }
    
    
    @IBOutlet var tableview: UITableView! = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        clearPreferences.layer.cornerRadius = clearPreferences.frame.size.height / 2.0
    }
    
    let clearPreferences: HomeButtons = {
       
        let button = HomeButtons()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Clear all preferences", for: .normal)
        button.titleLabel?.font = UIFont(name: "Trebuchet MS", size: 16)
        
        return button
    }()
    
    let noWinesLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        label.text = "You dont have any wines saved yet"
        label.textAlignment = .center
        label.font = UIFont(name: "Trebuchet MS", size: 20)
        
        return label
    }()
    
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.allowsSelectionDuringEditing = false
        tableview.register(WineCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func setUpLayout() {
        
        view.addSubview(clearPreferences)
        view.addSubview(tableview)
        if wines.isEmpty {
            view.addSubview(noWinesLabel)
            noWinesLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 80.0).isActive = true
            noWinesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
            noWinesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
            noWinesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
            
        }
        
        clearPreferences.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        clearPreferences.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60.0).isActive = true
        clearPreferences.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0).isActive = true
        clearPreferences.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60.0).isActive = true
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.clearPreferences.topAnchor, constant: -10.0),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wines.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WineCell
        cell.backgroundColor = UIColor.white
        let wine = wines[indexPath.row]
        cell.isFav = Database.wasLiked(name: wine)
        cell.wineLabel.text = wine
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.text = showFavs ? "My Favs" : "My Wines"
        label.font = UIFont(name: "Trebuchet MS", size: 40)
        label.textAlignment = .center
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10.0).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        
        return view
    }
    


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetailsViewController(forWine: wines[indexPath.row])
    }
    
    fileprivate func showDetailsViewController(forWine wine: String) {
        
        let request = barcodeRequest(productName: wine)
        
        isFetchingWineDetails = true
        request.getProduct { (wine) in
            DispatchQueue.main.async {
                self.isFetchingWineDetails = false
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let wineDetailVC = storyBoard.instantiateViewController(withIdentifier: "WineDetailViewController") as! WineDetailViewController
                wineDetailVC.wine = wine
                
                self.navigationController?.pushViewController(wineDetailVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Database.remove(wine: wines[indexPath.row])
            wines.remove(at: indexPath.row)
            tableview.reloadData()
        }
    }
    
    @objc func clearDB(_ sender: Any) {
        Database.clearDB()
        
        wines.removeAll()
        
        DispatchQueue.main.async {
            self.viewDidLoad()
            self.tableview.reloadData()
        }
    }
    
    
}
