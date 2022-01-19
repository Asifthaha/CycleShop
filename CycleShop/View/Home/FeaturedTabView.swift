//
//  SwiftUIView.swift
//  TouchDown
//
//  Created by Asif Thaha on 08/01/22.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView{
            ForEach(cyclemodels){ model in
                FeaturedItemView(cyclemodel:model)
                    .padding(.top, 10)
                    .padding(.horizontal,14)
            
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewDevice("iPhone 13")
            .background(Color.gray)
    }
}

