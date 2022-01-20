//
//  LoginView.swift
//  CycleShop
//
//  Created by Asif Thaha on 14/01/22.
//

import SwiftUI


struct LoginView: View {

@Binding var userloggedIn : Bool
@State var showingSignup = false
@State var showFinishReg = false
@State var showingAlert = false

@State private var errorTitle = ""
@Environment(\.presentationMode) var presentationMode
    
@State var email = ""
@State var password = ""
@State var repeatPassword = ""
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
        .alert(isPresented: $showingAlert) {
            
            Alert(title: Text(self.errorTitle), dismissButton: .default(Text("OK")))
            
        }
        
        .sheet(isPresented: $showFinishReg) {
            
            FinishRegistrationview()
        }
        
       
}
    
    private func login() {
        
        if email != "" && password != "" {
            
            Fuser.loginUserWith(email: email, password: password) { error, isEmailVerified in
                
                if error != nil {
                    
                    self.errorTitle = "Incorrect email or password"
                    
                    self.showingAlert.toggle()
                    return
                }
                
                else if !isEmailVerified {
                    
                    self.errorTitle = "Please verify your email and login"
                    
                    self.showingAlert.toggle()
                    return
                }
                if Fuser.currentUser() != nil && Fuser.currentUser()!.onBoarding{
                    
                    print("login successful)")
                    
                    self.userloggedIn = true
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                } else {
                    
                    self.showFinishReg.toggle()
                   
                }
            }
        }
        
    }
    
    private func signUp() {
        
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                Fuser.registerUserwith(email: email, password: password) {(error) in
                    if error != nil {
                        if error!.localizedDescription .contains("The email address is already in use by another account") {
                            
                            self.errorTitle = "User already Exists"
                            
                            self.showingAlert.toggle()
                        }
                       
                        print("Error registering user", error!.localizedDescription)
                        return
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                 
                }
                
                
            } else {
                
                self.errorTitle = "Passwords do not match"
                
                self.showingAlert.toggle()
            }
            
        } else {
            
            self.errorTitle = "Email and Password must be set"
            self.showingAlert.toggle()
        }
   
    }
    
    private func resetPassword() {
        if email != "" {
            Fuser.resetPassword(email: email) { (error)in
                if error != nil {
                    
                    if error!.localizedDescription.contains("The email address is badly formatted") {
                        
                        self.errorTitle = "Check the email you have entered"
                        self.showingAlert.toggle()
                        return
                       
                    } else if error!.localizedDescription.contains("There is no user record corresponding to this identifier") {
                        
                        self.errorTitle = "User do not exist"
                        self.showingAlert.toggle()
                        return
                     
                    }
                   
                }
                self.errorTitle = "An email is sent to your inbox to reset password"
                self.showingAlert.toggle()
              print("Please check your email")
            }
           
        }else
        {
            self.errorTitle = "Enter your email and click me"
            self.showingAlert.toggle()
            print("email is empty")
        }
    
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userloggedIn: .constant(false))
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

