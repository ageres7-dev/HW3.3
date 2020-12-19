//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 17.12.2020.
//
import SwiftUI
//import Combine

class UserManager: ObservableObject {
    @AppStorage("isRegistered") var isRegistered = false
    @AppStorage("name") var name = ""
}
