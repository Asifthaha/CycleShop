//
//  CartView.swift
//  CycleShop
//
//  Created by Asif Thaha on 14/01/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shop : Shop
    var body: some View {
        HStack {
          
            
            
            Image(shop.selectedProduct!.image)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Shop())
            .previewLayout(.device)
            .padding()
    }
}
