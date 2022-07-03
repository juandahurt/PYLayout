//
//  PuraceTextField.swift
//  
//
//  Created by Juan Hurtado on 3/07/22.
//

import Foundation
import SwiftUI

public struct PuraceTextField: View {
    var placeholder: String
    @Binding var text: String
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }
    
    public var body: some View {
        TextField(placeholder, text: $text, onCommit: {
            print("asdf?")
        })
            .textFieldStyle(.plain)
            .padding(.horizontal, 12)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.05))
            )
            .font(PuraceStyle.Font.get(size: 12))
            .foregroundColor(PuraceStyle.Color.N1)
    }
}
