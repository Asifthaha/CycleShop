//
//  ProductModel.swift
//  CycleShop
//
//  Created by Asif Thaha on 10/01/22.
//

import Foundation

struct Product: Codable, Identifiable {
    
    
    let id : Int
    let name : String
    let image : String
    let price : Int
    let specification : String
}
