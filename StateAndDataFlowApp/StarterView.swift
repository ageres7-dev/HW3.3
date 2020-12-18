//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//

import SwiftUI

struct StarterView: View {
    
//    @EnvironmentObject var user: UserManager
    @AppStorage("isRegistered") var isRegistered = false
    
    var body: some View {
        Group {
            if isRegistered {
                ContentView()
            } else {
                RegisterdView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
//            .environmentObject(UserManager())
    }
}
