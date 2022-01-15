//
//  FooterView.swift
//  TouchDown
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 10 ){
            Text("We offer the most modern, comfortable, lightweight and durable bicycles in the market at afforadable prices.")
                .foregroundColor(.gray )
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Text("Copyright © Asif Thaha\nAll rights reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
            }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
