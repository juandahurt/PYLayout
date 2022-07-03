//
//  TextFieldExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 3/07/22.
//

import Foundation
import SwiftUI
import Purace

struct TextFieldExample: View {
    @State var text: String = ""
    
    var body: some View {
        PuraceTextField("Hola", text: $text)
            .padding()
        Spacer()
    }
}
