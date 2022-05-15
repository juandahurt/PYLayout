//
//  PYTextView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import SwiftUI

public struct PYTextView: View {
    let content: String
    let fontSize: Int
    let textColor: Color
    let weight: PYTextWeight
    
    public init(_ content: String, fontSize: Int = 12, textColor: Color = .black, weight: PYTextWeight = .regular) {
        self.content = content
        self.fontSize = fontSize
        self.textColor = textColor
        self.weight = weight
    }
    
    private func getFont() -> Font {
        var fontName = "Poppins-"
        switch weight {
        case .regular:
            fontName += "Regular"
        case .medium:
            fontName += "Medium"
        case .semibold:
            fontName += "SemiBold"
        }
        return .custom(fontName, size: CGFloat(fontSize))
    }
    
    public var body: some View {
        Text(content)
            .font(getFont())
            .foregroundColor(textColor)
    }
}
