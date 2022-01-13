//
//  TopPartDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct TopPartDetailView: View {
    @EnvironmentObject var shop :Shop
    @State private var isAnimating:Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)
                Text("SEK \(shop.selectedProduct?.price ?? sampleProduct.price)")
                    .font(.title2)
                    .fontWeight(.black)
                    .scaleEffect(1, anchor: .leading)
                
            })
                .offset(y: isAnimating ? -50 : -75)
        
            HStack (alignment: .center, spacing: 6, content: {
           
                Image(shop.selectedProduct?.image ?? sampleProduct.image)
                .resizable()
                .scaledToFill()
                .offset(y: isAnimating ? 0 : -35)
                .cornerRadius(12)  })
            
        })
            .onAppear(perform: {
                withAnimation(.easeOut(duration: 0.75)){
                    isAnimating.toggle()
                }
            })
    }
}

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
