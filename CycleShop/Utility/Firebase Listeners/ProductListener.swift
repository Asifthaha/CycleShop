//
//  ProductListener.swift
//  CycleShop
//
//  Created by Asif Thaha on 16/01/22.
//

import Foundation

import Firebase

class ProductListener: ObservableObject {
    
    @Published var myProducts : [Product] = []
    
    init(){
        
        downloadProducts()
        
        
    }
    func downloadProducts(){
        
        FirebaseReference(.Products).getDocuments {(snapshot, error) in
        
        guard let snapshot = snapshot else {return}
        
        if !snapshot.isEmpty {
            
            self.myProducts = ProductListener.productFromDictinary(snapshot)
        }
            
        }
    }

static func productFromDictinary(_ snapshot: QuerySnapshot) -> [Product] {
    
    var allProducts : [Product] = []
    for snapshot in snapshot.documents {
        
        let ProductData = snapshot.data()
        allProducts.append(Product(id: ProductData[kID] as? String ?? "1", name: ProductData[kNAME] as? String ?? "unknown",image: ProductData[kIMAGE] as? String ?? "unknown" , price: ProductData[kPRICE] as? Int ?? 0, specification: ProductData[kSpec] as? String ?? "unknown") )
        
      
        
    }
    
    return allProducts
    
}

}
