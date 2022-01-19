//
//  ProductModel.swift
//  CycleShop
//
//  Created by Asif Thaha on 10/01/22.
//

import Foundation
import SwiftUI

struct Product: Codable, Identifiable {
    
    
    let id : Int
    let name : String
    let image : String
    let price : Int
    let specification : String
}

func productDictionaryFrom(product: Product) -> [String: Any] {
    
    return NSDictionary(objects: [product.id,
                                 product.name,
                                 product.image,
                                 product.price
                                 ],
                        forKeys: [kID as NSCopying,
                                  kNAME as NSCopying,
                                  kIMAGE as NSCopying,
                                  kPRICE as NSCopying
                                  
                        ]) as! [String: Any]
}

func createProduct() {
    
    for product in products  {
        FirebaseReference(.Products).addDocument(data: productDictionaryFrom(product: product))
   
        
    }
}
