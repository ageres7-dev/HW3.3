//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//

import SwiftUI

struct StarterView: View {
    @AppStorage("isRegistered") var isRegistered = false
    
    var body: some View {
        Group {
            if isRegistered {
                TimerView()
            } else {
                RegisterdView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
