//
//  AccessoryItemView.swift
//  CycleShop
//
//  Created by Asif Thaha on 09/01/22.
//

import SwiftUI

struct AccessoryItemView: View {
    
    let accessory : Accessory
    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 4) {
                Image(accessory.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.gray)
                Text(accessory.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1))
        })
    }
}

struct AccessoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryItemView(accessory: accessories[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
