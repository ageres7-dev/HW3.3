//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
                        
            VStack {
                Spacer(minLength: 300)
                
                TimerButton(timer: timer)
                Spacer()
                
                LogOutButton(action: logOutAction)
            }
            .padding()
            
            Spacer()
        }
    }
}

extension TimerView {
    private func logOutAction() -> Void {
        user.isRegistered = false
        user.name = ""
    }
}

struct TimerButton: View {
    @StateObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
//        .frame(width: 200, height: 60)
//        .background(Color.red)
//        .cornerRadius(20)
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(Color.black, lineWidth: 4)
//        )
        .setStyleButtonWithFrame(background: .red)
    }
}

struct LogOutButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .setStyleButtonWithFrame(background: .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager())
    }
}

struct LogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButton(action: {})
    }
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(timer: TimeCounter())
    }
}
