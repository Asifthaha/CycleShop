//
//  TitleView.swift
//  CycleShop
//
//  Created by Asif Thaha on 10/01/22.
//

import SwiftUI

struct TitleView: View {
    var title : String
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
            .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom,10)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: StaticText.bikes)
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
