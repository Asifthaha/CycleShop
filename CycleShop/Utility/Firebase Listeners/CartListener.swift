//
//  CartListener.swift
//  CycleShop
//
//  Created by Asif Thaha on 16/01/22.
//

import Foundation
import Firebase

class CartListener : ObservableObject{
    
    @Published var orderCart : CartOrder!
    
    init() {
        
        downloadCart()
    }
    
    func downloadCart() {
        
        FirebaseReference(.Cart).whereField(kOWNERID, isEqualTo: Fuser.currentId()).addSnapshotListener{( snapshot, error) in
            
            guard let snapshot = snapshot else {return}
            
            if !snapshot.isEmpty {
                
                let cartData = snapshot.documents.first!
                
        getProductsFromFirestore(withIds: cartData[kPRODUCTID] as? [String] ?? []) {(allProducts) in
            
            let cart = CartOrder()
            
            cart.ownerId = (cartData[kOWNERID] as? String)!
            cart.id = cartData[kID] as? String
            
            cart.items = allProducts
            self.orderCart = cart
            
                    
                }
            
        }
            
        }
        
    }
}

func getProductsFromFirestore(withIds:[String], completion: @escaping(_ productArray:[Product])-> Void) {
    
    var count = 0
    var productArray :[Product] = []
    
    if withIds.count == 0 {
        
        completion(productArray)
        return
    }
    for productID in withIds {
        FirebaseReference(.Products).whereField(kID, isEqualTo: productID).getDocuments{(snapshot, error) in
            
            guard let snapshot = snapshot else {return}
            if !snapshot.isEmpty {
                
                let productData = snapshot.documents.first!
                productArray.append(Product(id: productData[kID] as? Int ?? 1, name: productData[kNAME] as? String ?? "unknown", image: productData[kIMAGE] as? String ?? "unknown", price: productData[kPRICE] as? Int ?? 0, specification: productData[kSpec] as? String ?? "unknown"))
                
                count += 1
                
                
            } else {
                
                completion(productArray)
            }
            if count == withIds.count {
                
         completion(productArray)
            }
    
}

    }
}
