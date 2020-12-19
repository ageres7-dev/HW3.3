//
//  StarterView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//

import SwiftUI

struct StarterView: View {
    //Видимо я все сделал неправильно в UserManager. Если использовать вот это
    //    @EnvironmentObject var user: UserManager
    //то переход на следующий экран срабатывает только при перезапуске приложения
    
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
