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
        case wrongEmailPass
        case verifyEmail
        case existingUser
        case passwordsNoMatch
        case setEmailPass
        case checkEmailEntered
        case userNotExist
        case resetPassword
        case emailEmpty
        case signUp
    }
    var body: some View {
        VStack{
            
        Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom, .top],20)
            
        VStack(alignment: .leading){
                
        VStack(alignment: .leading){
                    
        Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                TextField("Enter your email", text: $email)
                    Divider()
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    SecureField("Enter your password", text: $password)
                    Divider()
                    if showingSignup {
                        Text("Repeat password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        SecureField("Repeat password", text: $repeatPassword)
                        Divider()
                    }
            
                }.padding(.bottom, 15)
                    .animation(.easeOut(duration: 0.1))
                  
                HStack{
                    
                    Spacer()
                    Button(action: {self.resetPassword()}, label: {
                        Text("Forgot password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    })
                }//End of Hstack
                
                
            }.padding(.horizontal, 6)
            Button(action: {
                self.showingSignup ? self.signUp() : self.login()
            }, label: {
                Text(showingSignup ? "Sign Up" : "Sign In")
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
                    alertType = .wrongEmailPass
                    self.showingAlert.toggle()
                    return
                }
                
                else if !isEmailVerified {
                    alertType = .verifyEmail
                    self.showingAlert.toggle()
                    return
                }
                if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding{
                    
                    print("login successful)")
                    
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
        case .wrongEmailPass:
            return Alert(title: Text("Incorrect Email or Password"))
        case .verifyEmail:
            return Alert(title: Text("Please verify your email and login"))
        case .existingUser:
            return Alert(title: Text("User Already exists"))
        case .passwordsNoMatch:
            return Alert(title: Text("Passwords do not match"))
        case .setEmailPass:
            return Alert(title: Text("Email and password must be set"))
        case .checkEmailEntered:
            return Alert(title: Text("Check the email you have entered"))
        case .userNotExist:
            return Alert(title:Text("User do not exixt"))
        case .resetPassword:
            return Alert(title:Text("An email is sent to your inbox to reset password"))
        case .emailEmpty:
            return Alert(title:Text("Enter your email and click me"))
        case .signUp:
            return Alert(title: Text("Please verify the link sent to your inbox and login"),  dismissButton: .default(Text("Ok"), action: {
                self.presentationMode.wrappedValue.dismiss() }))
                  
        default:
            return Alert(title:Text("Error"))
        }
        
    }
    
    private func signUp() {
        
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                Fuser.registerUserwith(email: email, password: password) {(error) in
                    if error != nil {
                        if error!.localizedDescription .contains("The email address is already in use by another account") {
                           
                            alertType = .existingUser
                            
                            self.showingAlert.toggle()
                        }
                       
                        print("Error registering user", error!.localizedDescription)
                        return
                    }
                    
                    alertType = .signUp
                    self.showingAlert.toggle()
                
                }
                
                
            } else {
                alertType = .passwordsNoMatch
                
                self.showingAlert.toggle()
            }
            
        } else {
            alertType = .setEmailPass
            self.showingAlert.toggle()
        }
   
    }
    
    private func resetPassword() {
        if email != "" {
            Fuser.resetPassword(email: email) { (error)in
                if error != nil {
                    
                    if error!.localizedDescription.contains("The email address is badly formatted") {
                
                        alertType = .checkEmailEntered
                        self.showingAlert.toggle()
                        return
                       
                    } else if error!.localizedDescription.contains("There is no user record corresponding to this identifier") {
                      
                        alertType = .userNotExist
                        self.showingAlert.toggle()
                        return
                     
                    }
                   
                }
               
                alertType = .resetPassword
                self.showingAlert.toggle()
              print("Please check your email")
            }
           
        }else
        {
            alertType = .emailEmpty
            self.showingAlert.toggle()
            print("email is empty")
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
           Text("Dont have an Account?")
                    .foregroundColor(Color.gray.opacity(0.5))
                Button(action: {
                    self.showingSignup.toggle()
                }, label: {
                    
                    Text("Sign Up")
                    
                }).foregroundColor(.blue)
                
            }//End of Hstack
            .padding()
        }
    }
}

