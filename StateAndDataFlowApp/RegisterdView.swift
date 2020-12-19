//
//  RegisterdView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct RegisterdView: View {
    @State private var tempName = ""
    @AppStorage("isRegistered") var isRegistered = false
    @AppStorage("name") var name = ""
  
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                TextField("Enter your name", text: $tempName)
                    .multilineTextAlignment(.center)
                Spacer()
                
                CountText(text: tempName, isValidName: isValidName)
            }

            LogInButton(action: registerUser, disabled: !isValidName)
            
            Spacer()
            
        }
        .padding()
    }
}


extension RegisterdView {
    private var isValidName: Bool {
        tempName.count > 2 ? true : false
    }
    
    private func registerUser() {
        if !tempName.isEmpty, isValidName {
            name = tempName
            isRegistered = true
        
        }
    }
}


struct LogInButton: View {
    let action: () -> Void
    let disabled: Bool
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
        }
        .disabled(disabled)
    }
}


struct RegisterdView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterdView()
//            .environmentObject(UserManager())
    }
}


struct LogInButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInButton(action: {}, disabled: false)
    }
}
