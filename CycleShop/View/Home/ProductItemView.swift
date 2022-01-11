//
//  ProductItemView.swift
//  CycleShop
//
//  Created by Asif Thaha on 10/01/22.
//

import SwiftUI

struct ProductItemView: View {
    let product : Product
    var body: some View {
        VStack (alignment: .leading, spacing: 6, content: {
            ZStack {
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    
                  
            }
            .cornerRadius(12)
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            Text("SEK \(product.price)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            
            
            
        })
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
