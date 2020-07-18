//
//  bcApi.swift
//  wineApp2
//
//  Created by stephanie on 7/13/20.
//  Copyright © 2020 stephanie. All rights reserved.
//

import Foundation
import UIKit

enum BarcodeError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct barcodeRequest {
    let resourceURL: URL

    
    init(barcode:String) {
        let resourceString = "https://api.barcodelookup.com/v2/products?barcode=\(barcode)&formatted=y&key=____"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    

     func getProduct(completion: @escaping((Wine)-> Void)) -> Void {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _,_ in

            guard let jsonData = data else {
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options:[]) as? [String:Any] else {
                return
            }
            let product = json["products"] as! [Any]
            let productInfo = product[0] as! [String:Any]
            let name = productInfo["product_name"] as! String
            let brand = productInfo["brand"] as! String
            let imageUrl = (productInfo["images"] as! [String]).first
            
            var wine = Wine(product_name: name, brand: brand, imageUrl: imageUrl!)
            self.getImage(imageUrl: imageUrl!) { (image) in
                wine.image = image
                completion(wine)
            }
        }
        dataTask.resume()
    }
    
    func getImage(imageUrl: String, completion: @escaping((UIImage)-> Void)) -> Void {
        let url = URL(string: imageUrl)!
        let dataTask = URLSession.shared.dataTask(with: url) {data, _,_ in
    
            guard let imageData = data else {
                return
            }
            
            let image = UIImage(data: imageData)!
            completion(image)
        }
        dataTask.resume()
    }

}
