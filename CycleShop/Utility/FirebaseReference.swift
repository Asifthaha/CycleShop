//
//  FirebaseReference.swift
//  CycleShop
//
//  Created by Asif Thaha on 13/01/22.
//

import Foundation
import FirebaseFirestore
import GameController

enum FcollectionReference : String {
    
    case User
    case Products
    case Order
    case Basket
    
}

func FirebaseReference(_ collectionReference : FcollectionReference )->
CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}


