//
//  CountText.swift
//  StateAndDataFlowApp
//
//  Created by Сергей on 19.12.2020.
//

import SwiftUI

struct CountText: View {
    let text: String
    let isValidName: Bool
    
    private var color: Color {
        isValidName ? .green : .red
    }
    
    var body: some View {
        Text("\(text.count)")
            .foregroundColor(color)
    }
}

struct CountText_Previews: PreviewProvider {
    static var previews: some View {
        CountText(text: "test", isValidName: true)
    }
}
