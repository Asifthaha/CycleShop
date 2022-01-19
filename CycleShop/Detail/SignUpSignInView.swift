//
//  UserAccountView.swift
//  CycleShop
//
//  Created by Asif Thaha on 13/01/22.
//

import SwiftUI

struct SignUpSignInView: View {
    
   
    @EnvironmentObject var userStatus : UserStatus
    @State var showingLoginView = false
    
    var body: some View {
        VStack {
            if userStatus.userloggedIn == false {
                
                
                
                Button(action:
                   
                       { self.showingLoginView.toggle()
               }
              
               , label: {
                   Text("Sign In")
                       .font(.footnote)
                       .fontWeight(.heavy)
                       .foregroundColor(.gray)
                       .padding(.bottom, 1)
                
               
            
            }) .sheet(isPresented: $showingLoginView){
                
                LoginView()
            } } else  {
                
                Button(action: {
                Fuser.logOutCurrentUser { (error) in
                    print("Error logging out", error?.localizedDescription)
                }
            }, label: {
                Text("Logout")
                    .font(.footnote)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
                .padding(.top, 1)
                
                
               
            
            }) }
           
        }
            
    }
}

struct SignUpSignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSignInView()
            .previewLayout(.sizeThatFits)
            .environmentObject(UserStatus())
            
    }
}
