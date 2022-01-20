//
//  NavigationBarView.swift
//  TouchDown
//
//  Created by Asif Thaha on 07/01/22.
//

import SwiftUI

struct NavigationBarView: View {
    @State private var showingCart = false
    @State private var isAnimated : Bool = false
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0 )
                .offset(x:-50, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                    
                })
            Button(action: {
                self.showingCart.toggle()
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }
            }).sheet(isPresented: $showingCart){
                
               if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding {
                    
                    
                    CartView()
                } else if Fuser.currentUser() != nil {
                    
                    LoginView(userloggedIn: .constant(false)) }
            }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    
    }
}
