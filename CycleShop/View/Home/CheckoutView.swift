//
//  CheckoutView.swift
//  CycleShop
//
//  Created by Asif Thaha on 23/01/22.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var cartListener = CartListener()
    static let paymentTypes = [ "Credit/Debit Card" , "Swish" , "Klarna"]
    @State private var paymentType = 0
    @State private var showingPaymentAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var totalPrice : Int {
        
        let total = cartListener.orderCart.total
        return total
    }
    var body: some View {
        
        Form{
            Section {
                
                Picker(selection: $paymentType,  label: Text("Choose payment method")){
                    
                    ForEach(0 ..< Self.paymentTypes.count) {
                        
                        Text(Self.paymentTypes[$0])
                    }
                }
             
            }
            
         
            
            Section(header: Text("Total: SEK \(totalPrice)").font(.title3).fontWeight(.bold)) {
                
           
                Button(action: {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                    self.showingPaymentAlert.toggle()
                    self.createOrder()
                    self.emptyCart()
                        
                    }
                    
                }) {
                    Text("Confirm Order")
                    
                }
            }.disabled(self.cartListener.orderCart?.items.isEmpty ?? true)
        
        }.navigationBarTitle(Text("Payment"), displayMode : .inline)
        .
         alert(isPresented: $showingPaymentAlert) {
            
             Alert(title: Text("Order Confirmed"), message: Text("Thank you!"), dismissButton: .default(Text("Ok"), action: {
                 
                 self.presentationMode.wrappedValue.dismiss()
                 
             }))
        }
    }
    
    
    private func createOrder() {
        
        let order = Order()
        order.amount = totalPrice
        order.id = UUID().uuidString
        order.customerId = Fuser.currentId()
        order.orderItems = self.cartListener.orderCart.items
        order.saveOrderToFirestore()
    }
    
    private func emptyCart(){
        
        self.cartListener.orderCart.emptyCart()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
