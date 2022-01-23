//
//  CompleteRegistration.swift
//  CycleShop
//
//  Created by Asif Thaha on 15/01/22.
//

import SwiftUI

struct FinishRegistrationview: View {
    
    @State var showingContentView = false
    @EnvironmentObject var shop : Shop
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    @State var surname = ""
    @State var telephone = ""
    @State var address = ""
    var body: some View {
        Form{
            Section(){
                Text("Finish Registration")
                    .fontWeight(.bold)
                    .font(.title)
                    
                    .padding([.top, .bottom], 20)
                TextField("Name", text: $name)
                TextField("Surname", text: $surname)
                TextField("Telephone", text: $telephone)
                TextField("Address", text: $address)
              
            }//End of section
            
            Section(){
                Button(action: {self.finishRegistration()}, label: {
                    Text("Finish Registration")
                })
            } .disabled(!self.fieldsCompleted())
        }//End of form
       
    }
    
    private func fieldsCompleted() -> Bool {
        
        return self.name != "" && self.surname != "" && self.telephone != "" && self.address != ""
    }
    
    private func finishRegistration() {
        
        let fullName = name + " " + surname
        
        updateCurrentUser(withValues: [kFIRSTNAME : name,kLASTNAME : surname , kFULLNAME: fullName, kFULLADRESS : address, kPHONENUBER: telephone, kONBOARD : true ]) { (error) in
            if error != nil {
                
                print("error updating user")
                return
            }
            
           
            self.presentationMode.wrappedValue.dismiss()
            self.shop.userLoggedIn = true
        
        }
    }
}

struct FinishRegistration_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationview()
    }
}
