//
//  File.swift
//  CycleShop
//
//  Created by Asif Thaha on 12/01/22.
//

import Foundation

class Shop : ObservableObject{
    
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}


class UserStatus : ObservableObject {
    
    @Published var userloggedIn : Bool = false
    
}

