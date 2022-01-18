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
    var ownerId : String = ""
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

    }

    func saveCarttoFirebase(){

        FirebaseReference(.Cart).document(self.id).setData(CartDictionaryFrom(self))
    }
}

func CartDictionaryFrom(_ cart : CartOrder)->[String : Any] {

    var allProductNames : [String] = []

    for product in cart.items {
        
        allProductNames.append(product.name)
      
    }
    
    return NSDictionary(objects: [cart.id!,
                                  cart.ownerId,
                                  allProductNames],
                                 
                        forKeys: [kID as NSCopying,
                                 kOWNERID as NSCopying,
                                  kNAME as NSCopying]) as! [String : Any]
}
