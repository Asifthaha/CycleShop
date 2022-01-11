//
//  ContentView.swift
//  TouchDown
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            VStack (spacing : 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top , UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing : 0){

                FeaturedTabView()
                            .frame(width:400, height: 250, alignment: .top)
                            .padding(.vertical, 10)
                            .padding(.horizontal,2)
                            
                        AccessoryGridView()
                        TitleView(title: "Bikes")
                       
                        LazyVGrid(columns: gridLayout,spacing: 15, content: {
                            ForEach(products) { product in  ProductItemView(product: product)}
                            .padding(15)
                            
                            
                        })
                         
                          
                FooterView()
                    .padding(.horizontal)
            }
                })
                
            }
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea(.all,edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
