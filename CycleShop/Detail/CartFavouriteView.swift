//
//  QuantityfavouriteView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct CartFavouriteView: View {
    
    @State private var showingAlert = false
    
    @EnvironmentObject var shop : Shop
    @State private var counter: Int = 0
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button(action: {
                feedback.impactOccurred()
                showingAlert.toggle()
               
            }, label: {
               
                Text("Add to Cart".uppercased())
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .frame(width: 275, height: 25, alignment: .center)
                
            })
                .padding(8)
                .background(
                    Color.pink
                )
                .clipShape(Capsule())
                
            
            
         
            
            Spacer ()
            Button(action: {}, label: {
                
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            })
        })
            .font(.system(.title, design: .rounded))
            .foregroundColor(.black)
            .imageScale(.large)
            .alert(isPresented: $showingAlert) {
                
                Alert(title: Text("Added to Cart"), dismissButton: .default(Text("OK")))
            }
    }
}

struct CartFavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        CartFavouriteView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}