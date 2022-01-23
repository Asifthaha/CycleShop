//
//  LoginView.swift
//  CycleShop
//
//  Created by Asif Thaha on 14/01/22.
//

import SwiftUI


struct LoginView: View {
    
@State var alertType : Alerts? = nil
@State var showingSignup = false
@State var showFinishReg = false
@State var showingAlert = false


@Environment(\.presentationMode) var presentationMode
@EnvironmentObject var shop: Shop
    
@State var email = ""
@State var password = ""
@State var repeatPassword = ""
    
    enum Alerts{
        case wrongEmailPass(text: String)
        case verifyEmail(text: String)
        case existingUser(text: String)
        case passwordsNoMatch(text: String)
        case setEmailPass(text: String)
        case checkEmailEntered(text: String)
        case userNotExist(text: String)
        case resetPassword(text: String)
        case emailEmpty(text: String)
        case signUp
    }
    var body: some View {
        VStack{
            Text(UtilityTexts.signIn)
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom, .top],20)
            
        VStack(alignment: .leading){
                
        VStack(alignment: .leading){
                    
            Text(UtilityTexts.email)
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
            TextField(UtilityTexts.enterEmail, text: $email)
                    Divider()
            Text(UtilityTexts.password)
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
            SecureField(UtilityTexts.enterPass, text: $password)
                    Divider()
                    if showingSignup {
                        Text(UtilityTexts.repeatPass)
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        SecureField(UtilityTexts.repeatPass, text: $repeatPassword)
                        Divider()
                    }
            
                }.padding(.bottom, 15)
                    .animation(.easeOut(duration: 0.1))
                  
                HStack{
                    
                    Spacer()
                    Button(action: {self.resetPassword()}, label: {
                        Text(UtilityTexts.forgotPass)
                            .foregroundColor(Color.gray.opacity(0.5))
                    })
                }//End of Hstack
            }.padding(.horizontal, 6)
            Button(action: {
                self.showingSignup ? self.signUp() : self.login()
            }, label: {
                Text(showingSignup ? UtilityTexts.signUp : UtilityTexts.signIn)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            })
                .background(Color.blue)
                .clipShape(Capsule())
                .padding()
            
            SignUpView(showingSignup: $showingSignup)
    }//End of Vstack
        .alert(isPresented: $showingAlert, content:  {
            
            getAlert()
        })
        
        .sheet(isPresented: $showFinishReg) {
            
            FinishRegistrationview()
        }
}
    
    private func login() {
        
        if email != "" && password != "" {
            
            Fuser.loginUserWith(email: email, password: password) { error, isEmailVerified in
                
                if error != nil {
                    alertType = .wrongEmailPass(text:AlertTexts.wrongEmailPass )
                    self.showingAlert.toggle()
                    return
                }
                
                else if !isEmailVerified {
                    alertType = .verifyEmail(text: AlertTexts.verifyEmail)
                    self.showingAlert.toggle()
                    return
                }
                if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding{
                    
                    self.shop.userLoggedIn = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                } else {
                    self.showFinishReg.toggle()
                   
                }
            }
        }
        
    }
    
    private func getAlert() -> Alert {
    
        switch alertType {
        case let .wrongEmailPass(text), let.verifyEmail(text), let .existingUser(text), let .passwordsNoMatch(text), let .setEmailPass(text), let .checkEmailEntered(text), let .userNotExist(text), let .resetPassword(text), let .emailEmpty(text):
            return Alert(title: Text(text))

        case .signUp:
            return Alert(title: Text(AlertTexts.signUpAlert),  dismissButton: .default(Text("Ok"), action: {
                self.presentationMode.wrappedValue.dismiss() }))
                  
        default:
            return Alert(title:Text(UtilityTexts.error))
        }
    }
    
    private func signUp() {
        
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                Fuser.registerUserwith(email: email, password: password) {(error) in
                    if error != nil {
                        if error!.localizedDescription.contains(FbaseTexts.existingUser) {
                            alertType = .existingUser(text:AlertTexts.existingUser )
                            self.showingAlert.toggle()
                        }
                        return
                    }
                    
                    alertType = .signUp
                    self.showingAlert.toggle()
                }
                
            } else {
                alertType = .passwordsNoMatch(text: AlertTexts.passwordsNoMatch)
                self.showingAlert.toggle()
            }
            
        } else {
            alertType = .setEmailPass(text: AlertTexts.setEmailPass)
            self.showingAlert.toggle()
        }
    }
    
    private func resetPassword() {
        if email != "" {
            Fuser.resetPassword(email: email) { (error)in
                if error != nil {
                    
                    if error!.localizedDescription.contains(FbaseTexts.badEmailFormat) {
                
                        alertType = .checkEmailEntered(text: AlertTexts.checkEmailEntered)
                        self.showingAlert.toggle()
                        return
                       
                    } else if error!.localizedDescription.contains(FbaseTexts.noUserExist) {
                      
                        alertType = .userNotExist(text: AlertTexts.userNotExist)
                        self.showingAlert.toggle()
                        return
                    }
                   
                }
               
                alertType = .resetPassword(text: AlertTexts.resetPassword)
                self.showingAlert.toggle()
              
            }
           
        }else
        {
            alertType = .emailEmpty(text: AlertTexts.emailEmpty)
            self.showingAlert.toggle()
           
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
}

struct SignUpView : View {
    
    @Binding var showingSignup : Bool
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack(spacing: 8){
                Text(UtilityTexts.noAccount)
                    .foregroundColor(Color.gray.opacity(0.5))
                Button(action: {
                    self.showingSignup.toggle()
                }, label: {
                    
                    Text(UtilityTexts.signUp)
                    
                }).foregroundColor(.blue)
                
            }//End of Hstack
            .padding()
        }
    }
}

