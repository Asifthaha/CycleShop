//
//  NavigationDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct NavigationDetailView: View {
    
    @State private var showingCart = false
    @ObservedObject var cartListener = CartListener()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        HStack{
            Button(action: {
                withAnimation(.easeIn){
                    feedback.impactOccurred()
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            }, label: {
                
                Image(systemName: ImageNames.chevron)
                    .font(.title)
                    .foregroundColor(.pink)
            })
            Spacer()
            
           Button(action: {
               self.presentationMode.wrappedValue.dismiss()
                  self.showingCart.toggle()
           }
              
           , label: {
               
               if self.cartListener.orderCart?.items.isEmpty == true {
                
                   Image(systemName: ImageNames.cart)
                   .font(.title)
                   .foregroundColor(.pink) } else {
                       
                       ZStack {
                           Image(systemName: ImageNames.cart)
                               .font(.title)
                           .foregroundColor(.pink)
                           
                           Circle()
                               .fill(Color.red)
                               .frame(width: 14, height: 14, alignment: .center)
                               .offset(x: 13, y: -10)
                       }
                   }
           })
             
           }.sheet(isPresented: $showingCart){
               
               if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding {
                   CartView()
               } else if Fuser.currentUser() != nil {
                   FinishRegistrationview()
                   
               } else {
                   LoginView()
               }
         
        }
    }
}

struct NavigationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
