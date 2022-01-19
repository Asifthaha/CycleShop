//
//  CartView.swift
//  CycleShop
//
//  Created by Asif Thaha on 17/01/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartListener = CartListener()
    var body: some View {
        NavigationView{
            
            List {
                Section{
                    ForEach(self.cartListener.orderCart?.items ?? []) {
                        product in
                        HStack{
                            Text(product.name)
                            Spacer()
                            Text("SEK\(product.price)")
                        }
                    }
                }
                
                Section{
                    
                    Text("Place Order")
                }.disabled(self.cartListener.orderCart?.items.isEmpty ?? true)
            }//End of List
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        }//End of Navigation
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
