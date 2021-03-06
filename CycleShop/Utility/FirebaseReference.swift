//
//  FirebaseReference.swift
//  CycleShop
//
//  Created by Asif Thaha on 13/01/22.
//

import Foundation
import FirebaseFirestore
import Firebase


enum FCollectionReference : String {
    
    case User
    case Products
    case Order
    case Cart
    
}

func FirebaseReference(_ collectionReference : FCollectionReference ) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
    
    
    

}


