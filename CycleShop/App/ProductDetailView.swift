//
//  ProductDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop : Shop
    
   
    
    var body: some View {
       
        VStack(alignment: .leading, spacing:5,  content: {
            NavigationDetailView()
                .padding(.horizontal)
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
         HeaderDetailView()
                .padding(.horizontal)
            
            TopPartDetailView()
                .padding(.top, 60)
                .padding(.horizontal)
            Spacer()
            VStack(alignment: .center, spacing: 0, content: {
                RatingsView()
                    .padding(.horizontal, 2)
                Spacer()
                ScrollView(.vertical,showsIndicators: false, content: {
                    Text(shop.selectedProduct?.specification ?? sampleProduct.specification)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.leading)
                })
                CartButtonView()
                    .padding(.vertical, 10)
                Spacer()
            })
                .padding(.horizontal)
           
               
                
            Spacer()
        })
            .ignoresSafeArea(.all, edges: .all)
            .background(
                (Color(red: 218/255, green: 221/255, blue: 252/255)).ignoresSafeArea(.all, edges: .all)
            )
        
       
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
     
    }
}
