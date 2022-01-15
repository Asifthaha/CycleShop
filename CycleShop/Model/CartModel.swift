//
//  CartModel.swift
//  CycleShop
//
//  Created by Asif Thaha on 14/01/22.
//

import Foundation
import Firebase

//class CartOrder : Identifiable {
//
//    var id : String!
//    var ownerId : String
//    var items : [Product] = []
//
//    var total: Int {
//        if items.count > 0 {
//
//            return items.reduce(0) { $0 + $1.price}
//            }
//            else
//            {
//
//                return 0
//            }
//    }
//
//        func add(_ item : Product) {
//            items.append (item)
//        }
//
//    func emptyCart() {
//
//        self.items = []
//
//    }
//
//    func saveCarttoFirebase(){
//
//        FirebaseReference(.Basket).document(self.id).setData(<#T##documentData: [String : Any]##[String : Any]#>)
//    }
//}
//
//func basketDictionary(_basket : CartOrder)->[String : Any] {
//
//    var allProductIds : [String] = []
//
//    for product in basket.items {
//        
//        allProductIds.append(product.id)
//    }
//}
