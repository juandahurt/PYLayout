//
//  PuraceAccordionView.swift
//  
//
//  Created by Juan Hurtado on 13/06/22.
//

import Foundation
import SwiftUI

public struct PuraceAccordionView<Content: View>: View {
    private let closeColor = Color.white
    private let openColor = PuraceStyle.Color.G8.opacity(0.3)
    
    private let openForegroundColor = PuraceStyle.Color.N1
    private let closeForegroundColor = PuraceStyle.Color.G1
    
    @State var isOpen = false
    @State var rotation: CGFloat = 270
    
    let title: String
    let content: Content
    
    public init(title: String, _ content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var header: some View {
        HStack {
            PuraceTextView(title, fontSize: 14, textColor: isOpen ? openForegroundColor : closeForegroundColor, weight: .medium)
            Spacer()
            Image(systemName: "chevron.left")
                .foregroundColor(isOpen ? openForegroundColor : closeForegroundColor)
                .rotationEffect(.degrees(rotation))
        }
        .padding(.vertical)
        .padding(.horizontal, 16)
        .background(
            ZStack(alignment: .bottom) {
                isOpen ? openColor : closeColor
                Divider()
            }
        )
        .onTapGesture {
            withAnimation(.linear(duration: 0.15)) {
                isOpen = !isOpen
                rotation = isOpen ? 90 : 270
            }
        }
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            header
            content
                .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: !isOpen ? 0 : .none)
                .clipped()
                .animation(.easeOut(duration: 0.2))
        }
    }
}
