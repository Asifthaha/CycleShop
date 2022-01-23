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
                    }.onDelete { (indexSet) in
                        self.deleteItems(at : indexSet)
                    }
                }
                
                Section{
                    
                    NavigationLink(destination: CheckoutView()) {
                    
                        Text("Place Order") }
                }.disabled(self.cartListener.orderCart?.items.isEmpty ?? true)
            }//End of List
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        }//End of Navigation
    }
    func deleteItems(at offsets : IndexSet) {
        
        self.cartListener.orderCart.items.remove(at: offsets.first!)
        self.cartListener.orderCart.saveCarttoFirebase()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
