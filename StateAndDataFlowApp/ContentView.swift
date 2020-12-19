//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 16.12.2020.
//

import SwiftUI

struct ContentView: View {
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
            
        
//            Button("exit") {
//                user.isRegistered = false
//                user.name = ""
//            }
//            .frame(width: 200, height: 60)
//            .background(Color.red)
//            .cornerRadius(20)
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.black, lineWidth: 4)
//            )
            
            VStack {
                Spacer(minLength: 300)
                
                ButtonView(timer: timer)
                
                Spacer()
                
                Button(action: {
                    user.isRegistered = false
                    user.name = ""
                }, label: {
                    Text("LogOut")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .frame(width: 200, height: 60)
                .background(Color.blue)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 4)
            )
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ButtonView: View {
    @StateObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    
    
//    init(tapCount: Binding<Int>, buttonColor: Color) {
//        self._tapCount = tapCount
//        self.buttonColor = buttonColor
//    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
