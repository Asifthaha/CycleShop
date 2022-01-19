//
//  AccessoryGridView.swift
//  CycleShop
//
//  Created by Asif Thaha on 09/01/22.
//

import SwiftUI

struct AccessoryGridView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false, content:{
            
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(accessories) {accessory in
                        AccessoryItemView(accessory: accessory)
                    }
                }
              
            })
                .frame(height: 165)
                .padding(.horizontal,15)
                .padding(.vertical, 10)
            
        }
        
        )
    }
}

struct AccessoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
