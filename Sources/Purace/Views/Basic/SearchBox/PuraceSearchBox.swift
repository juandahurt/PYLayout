//
//  PuraceSearchBox.swift
//  
//
//  Created by Juan Hurtado on 11/12/22.
//

import SwiftUI

public struct PuraceSearchBox: View {
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
            .frame(height: 35)
            .font(PuraceStyle.Font.get(size: 12))
            .foregroundColor(PuraceStyle.Color.N1)
        .modifier(ClearButton(text: $text))
        .modifier(LeadingSearchIcon())
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(PuraceStyle.Color.F1)
        )
    }
}


struct ClearButton: ViewModifier {
    @Binding var text: String

    init(text: Binding<String>) {
        self._text = text
    }

    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            Spacer(minLength: 0)
            Image("close", bundle: Bundle.module)
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" }
                .padding(.trailing, 15)
        }
    }
}

struct LeadingSearchIcon: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            Image("search", bundle: Bundle.module)
                .foregroundColor(.secondary)
                .padding(.leading, 15)
            Spacer(minLength: 0)
            content
        }
    }
}
