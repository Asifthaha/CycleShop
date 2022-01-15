//
//  NavigationDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct NavigationDetailView: View {
    
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
                
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.pink)
            })
            Spacer()
            
           Button(action: {}
              
           , label: {
                
                Image(systemName: "cart")
                   .font(.title)
                .foregroundColor(.pink)
           })
            
            
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
