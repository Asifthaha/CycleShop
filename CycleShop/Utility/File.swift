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
    @Published var userLoggedIn : Bool = false
    @Published var orderIsCompleted : Bool = false
}



