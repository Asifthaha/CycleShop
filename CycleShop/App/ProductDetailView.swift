//
//  ProductDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct ProductDetailView: View {
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
            VStack(alignment: .center, spacing: 0, content: {
                ScrollView(.vertical,showsIndicators: false, content: {
                    Text(sampleProduct.specification)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.leading)
                })
                Spacer()
            })
                .padding(.horizontal)
                
                
            Spacer()
        })
            .ignoresSafeArea(.all, edges: .all)
            .background(
                (Color(red: 174/255, green: 254/255, blue: 255/255)).ignoresSafeArea(.all, edges: .all)
            )
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
