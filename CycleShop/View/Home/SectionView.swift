//
//  SectionView.swift
//  CycleShop
//
//  Created by Asif Thaha on 10/01/22.
//

import SwiftUI

struct SectionView: View {
    
    @State var rotateClockwise: Bool
    var body: some View {
        VStack(spacing : 0){
            Spacer()
            Text("Accessories".uppercased())
                .font(.footnote)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees:rotateClockwise ? 90 :-90))
            Spacer()
        
            
        }
        .background(colorGray.cornerRadius(12))
        .frame(width:90)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
