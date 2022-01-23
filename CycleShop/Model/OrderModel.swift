//
//  OrderModel.swift
//  CycleShop
//
//  Created by Asif Thaha on 23/01/22.
//

import Foundation

class Order : Identifiable {
    
    var id : String!
    var customerId: String!
    var orderItems: [Product] = []
    var amount : Int!
    var customerName : String!
    var isCompleted : Bool!
    
    func saveOrderToFirestore() {
        
        FirebaseReference(.Order).document(self.id).setData(orderDictionaryFrom(self)) {
            error in
            
            if error != nil {
                
                print("error saving order to Firestore", error!.localizedDescription)
            }
        }
    }

}

func orderDictionaryFrom(_ order : Order) -> [String:Any] {
    
    var allProductIds: [String] = []
    
    for product in order.orderItems {
        
        allProductIds.append(product.id)
    }
    
    return NSDictionary(objects: [order.id!,
                                  order.customerId!,
                                  allProductIds,
                                  order.amount!,
                                  ],
                                 
                        forKeys: [kID as NSCopying,
                                  kCUSTOMERID as NSCopying,
                                  kPRODUCTIDS as NSCopying,
                                  kAMOUNT as NSCopying,
                                 ] ) as! [String : Any]
    
}
