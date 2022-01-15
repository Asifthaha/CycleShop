//
//  UserAccountView.swift
//  CycleShop
//
//  Created by Asif Thaha on 13/01/22.
//

import SwiftUI

struct SignUpSignInView: View {
    
    @State var showingLoginView = false
    var body: some View {
        HStack {
            Button(action: { self.showingLoginView.toggle()
                
            }, label: {
                Text("Be a Member / Sign in")
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                    .padding()
            }) .sheet(isPresented: $showingLoginView){
                
                LoginView()
            }
           
            
            
        }
    }
}

struct SignUpSignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSignInView()
            .previewLayout(.sizeThatFits)
    }
}
