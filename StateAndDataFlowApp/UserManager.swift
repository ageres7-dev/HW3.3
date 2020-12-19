//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//
import SwiftUI
import Combine

class UserManager: ObservableObject {
//    @AppStorage("isRegistered") var isRegistered = false
//    @AppStorage("name") var name = ""
    
    
    @Published var isRegistered: Bool {
        didSet{
            UserDefaults.standard.set(isRegistered, forKey: "isRegistered")
        }
    }
    
    @Published var name: String {
        didSet{
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    init() {
        isRegistered = UserDefaults.standard.object(forKey: "isRegistered") as? Bool ?? false
        name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
    }
}
