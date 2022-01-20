//
//  ContentView.swift
//  TouchDown
//
//  Created by Asif Thaha on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var productListener = ProductListener ()
    
    @State private var userloggedIn = false
    @State var logoutAlert = false
    
    
    @State var showingLoginView = false

    
    @EnvironmentObject var shop: Shop
   
    
    
    var body: some View {
       
       
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack (spacing : 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top , UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing : 0){

                    FeaturedTabView()
                                .frame(width:400, height: 250, alignment: .top)
                                .padding(.vertical, 10)
                                .padding(.horizontal,2)
                                
                            AccessoryGridView()
                            TitleView(title: "Bikes")
                           
                            LazyVGrid(columns: gridLayout,spacing: 15, content: {
                                ForEach(products) { product in  ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut) {
                                                
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }
                                .padding(15)

                            })
                            
                            if  userloggedIn == false {

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

                                LoginView(userloggedIn:$userloggedIn)
                            } } else  {

                                Button(action: {
                                Fuser.logOutCurrentUser { (error) in
                                    if error == nil {
                                        self.logoutAlert.toggle()
                                        self.userloggedIn.toggle()
                                    }
                                }
                            }, label: {
                                Text("Logout")
                                    .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                                .padding(.top, 1)


                            })
                            


                            }
                           
                            FooterView()
                        .padding(.horizontal)
                }
                    })
                    
                }
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea(.all,edges: .top)
        .alert(isPresented: $logoutAlert) {
            
            Alert(title: Text("Logged out"))
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
           
            
            
       
    }
}

