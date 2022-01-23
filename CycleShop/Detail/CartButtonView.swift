//
//  QuantityfavouriteView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct CartButtonView: View {
  
    @State private var showingLogin = false
    @ObservedObject var cartListener = CartListener()
    
    @EnvironmentObject var shop : Shop
    @State private var showingSize = false
    @State  var showingCartAlert: Bool = false
 
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 6, content: {
                Button(action: {
                    feedback.impactOccurred()
                    if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding{
                        
                        self.showingSize.toggle()
                      
                    }
                     else {
                        
                        self.showingLogin.toggle()
                
                    } }
               
                , label: {
                   
                    Text("Add to Cart".uppercased())
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .frame(width: 275, height: 25, alignment: .center)
        
                })
                    .padding(8)
                    .background(Color.pink)
                    .clipShape(Capsule())
                    .sheet(isPresented: self.$showingLogin) {
                    
                        if Fuser.currentUser() != nil {
                            FinishRegistrationview()
                    } else {
                        LoginView()
                    }
                }
            })
                .font(.system(.title, design: .rounded))
                .foregroundColor(.black)
                .imageScale(.large)
            .actionSheet(isPresented: $showingSize, content: showSize)
        }.alert(isPresented: $showingCartAlert, content: {
            
            Alert(title:Text(StaticText.addToCart))
        })
    }
    
    private func showSize() -> ActionSheet{
        
        let MButton: ActionSheet.Button = .default(Text("M"), action: { self.addItemtoCart()   })
        let LButton: ActionSheet.Button = .default(Text("L"), action: { self.addItemtoCart()  })
        let XLButton: ActionSheet.Button = .default(Text("XL"), action: {  self.addItemtoCart()   })
        let cancelButton : ActionSheet.Button = .cancel()

        return ActionSheet(title: Text(StaticText.chooseSize),  buttons: [MButton,LButton,XLButton, cancelButton])
    }
   
    private func addItemtoCart() {
        
        var orderCart : CartOrder!
        
        if self.cartListener.orderCart != nil {
            orderCart = self.cartListener.orderCart
            
        }else{
            
            orderCart = CartOrder()
            orderCart.ownerId = Fuser.currentId()
            orderCart.id = UUID().uuidString
        }
        
        orderCart.add(self.shop.selectedProduct!)
        orderCart.saveCarttoFirebase()
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


