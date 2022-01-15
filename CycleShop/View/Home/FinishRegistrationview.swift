//
//  CompleteRegistration.swift
//  CycleShop
//
//  Created by Asif Thaha on 15/01/22.
//

import SwiftUI

struct FinishRegistrationview: View {
    @State var name = ""
    @State var surname = ""
    @State var telephone = ""
    @State var address = ""
    var body: some View {
        Form{
            Section(){
                Text("Finish Registration")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
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
        
        
    }
}

struct FinishRegistration_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationview()
    }
}
