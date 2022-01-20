//
//  CartModel.swift
//  CycleShop
//
//  Created by Asif Thaha on 14/01/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class CartOrder : Identifiable {

    var id : String!
    var ownerId : String!
    var items : [Product] = []

    var total: Int {
        if items.count > 0 {

            return items.reduce(0) { $0 + $1.price}
            }
            else
            {

                return 0
            }
    }

        func add(_ item : Product) {
            items.append (item)
        }
    
   
    func emptyCart() {

        self.items = []
        saveCarttoFirebase()

    }

    func saveCarttoFirebase(){

        FirebaseReference(.Cart).document(self.id).setData(CartDictionaryFrom(self))
    }
}

func CartDictionaryFrom(_ cart : CartOrder)->[String : Any] {

    var allProductIds : [String] = []

    for product in cart.items {
        
        allProductIds.append(product.id)
      
    }
    
    return NSDictionary(objects: [cart.id!,
                                  cart.ownerId!,
                                  allProductIds],
                                 
                        forKeys: [kID as NSCopying,
                                 kOWNERID as NSCopying,
                                  kPRODUCTIDS as NSCopying]) as! [String : Any]
}
