//
//  NavigationDetailView.swift
//  CycleShop
//
//  Created by Asif Thaha on 11/01/22.
//

import SwiftUI

struct NavigationDetailView: View {
    var body: some View {
        HStack{
            
            Button(action: {}, label: {
                
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.pink)
            })
            Spacer()
            
            Button(action: {}, label: {
                
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.pink)
            })
        }
    }
}

struct NavigationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
        
    }
}
