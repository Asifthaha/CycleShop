//
//  LogoView.swift
//  TouchDown
//
//  Created by Asif Thaha on 07/01/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack (spacing: 4){
            
            Text("Cycle".uppercased())
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                
            Image("cycle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            Text("Shop".uppercased())
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
