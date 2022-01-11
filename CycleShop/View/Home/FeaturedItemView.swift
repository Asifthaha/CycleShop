//
//  FeaturedItemView.swift
//  TouchDown
//
//  Created by Asif Thaha on 07/01/22.
//

import SwiftUI

struct FeaturedItemView: View {
    
    let cyclemodel: Model
    
    var body: some View {
        ZStack {
            Image(cyclemodel.image)
               
                .resizable()
                .scaledToFill()
                .cornerRadius(12)
            
        
            
            
            Text(cyclemodel.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.top, 30)
                
                
        }
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(cyclemodel: cyclemodels[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
      
        
    }
}
