//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct TimerView: View {
//    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    @AppStorage("isRegistered") var isRegistered = false
    @AppStorage("name") var name = ""
    
    var body: some View {
        VStack {
            Text("Hi, \(name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
                        
            VStack {
                Spacer(minLength: 300)
                
                BestStyleButton(action: { timer.startTimer() },
                                title: "\(timer.buttonTitle)",
                                background: .red)
                Spacer()
                BestStyleButton(action: logOutAction,
                                title: "LogOut",
                                background: .blue)
            }
            .padding()
            
            Spacer()
        }
    }
}

extension TimerView {
    private func logOutAction() -> Void {
        isRegistered = false
        name = ""
    }
}

struct BestStyleButton: View {
    let action: () -> Void
    let title: String
    let background: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(background)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
//            .environmentObject(UserManager())
    }
}

struct BestStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        BestStyleButton(action: {}, title: "Button", background: .red)
    }
}
