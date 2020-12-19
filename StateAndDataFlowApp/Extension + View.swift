//
//  Extension + View.swift
//  StateAndDataFlowApp
//
//  Created by Сергей on 20.12.2020.
//

import SwiftUI

struct StyleButtonWithFrame: ViewModifier {
    let background: Color
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(background)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
        
    }
}
extension View {
    func setStyleButtonWithFrame(background:Color) -> some View {
        self.modifier(StyleButtonWithFrame(background: background))
    }
}


struct Extension_View_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        }.setStyleButtonWithFrame(background: .red)
        
    }
}
