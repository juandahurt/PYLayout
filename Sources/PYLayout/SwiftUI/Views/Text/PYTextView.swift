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
    
    public init(_ content: String, fontSize: Int, textColor: Color = .black) {
        self.content = content
        self.fontSize = fontSize
        self.textColor = textColor
    }
    
    public var body: some View {
        Text(content)
            .font(.system(size: CGFloat(fontSize)))
            .foregroundColor(textColor)
    }
}
