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
    
    public init(_ content: String, fontSize: Int) {
        self.content = content
        self.fontSize = fontSize
    }
    
    public var body: some View {
        Text(content)
            .font(.system(size: CGFloat(fontSize)))
    }
}
