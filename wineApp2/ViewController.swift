//
//  ViewController.swift
//  wineApp2
//
//  Created by stephanie on 7/11/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import UIKit
import BarcodeScanner

class ViewController: UIViewController {

    var hasCapturedCode = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addWinePressed(_ sender: Any) {
        let scannerVC = BarcodeScannerViewController()
        scannerVC.codeDelegate = self
        navigationController?.pushViewController(scannerVC, animated: true)
    }
    
    @IBAction func myFavsPressed(_ sender: Any) {
        let myFavsVC = WineListController(showFavs: true)
        navigationController?.pushViewController(myFavsVC, animated: true)
    }
    
    @IBAction func allWinesPressed(_ sender: Any) {
        let myFavsVC = WineListController(showFavs: false)

        navigationController?.pushViewController(myFavsVC, animated: true)
    }
    
    
    func showWine(_ wine:Wine) {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let wineDetailVC = storyBoard.instantiateViewController(withIdentifier: "WineDetailViewController") as! WineDetailViewController
            wineDetailVC.wine = wine
            
            self.navigationController?.pushViewController(wineDetailVC, animated: true)
        }

    }

}

extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        //
        if hasCapturedCode { return }
        hasCapturedCode = true
        
        let request = barcodeRequest(barcode: code)
        
        request.getProduct { (wine) in
            DispatchQueue.main.async {
                controller.dismiss(animated: true, completion: nil)
                self.showWine(wine)
                self.hasCapturedCode = false
                controller.reset()
            }
        }
        
    }
    
    
}
