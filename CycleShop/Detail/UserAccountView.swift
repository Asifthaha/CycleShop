//
//  UserAccountView.swift
//  CycleShop
//
//  Created by Asif Thaha on 13/01/22.
//

import SwiftUI

struct UserAccountView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Text("Be a Member")
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                    .padding()
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                    .padding()
            })
        }
    }
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
            .previewLayout(.sizeThatFits)
    }
}
