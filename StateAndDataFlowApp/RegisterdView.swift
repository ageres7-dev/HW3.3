//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
  
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                
                Spacer()
                CountText(text: name, isValidName: isValidName)
            }

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(!isValidName)
            
            Spacer()
            
        }
        .padding()
    }
    
    private var isValidName: Bool {
        name.count > 2 ? true : false
    }
    
    private func registerUser() {
        if !name.isEmpty, isValidName {
            user.name = name
            user.isRegistered = true
        }
    }
}


struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
            .environmentObject(UserManager())
    }
}

