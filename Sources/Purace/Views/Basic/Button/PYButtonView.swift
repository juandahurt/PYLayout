//
//  PYButtonView.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation
import SwiftUI

public struct PYButtonView: View {
    @State var backgroundColor: Color = .blue
    @State var isBeingPressed = false
    
    let title: String
    let fontSize: Int
    let type: PYButtonType
    let onTap: (() -> Void)?
    
    public init(_ title: String, fontSize: Int = 12, type: PYButtonType = .loud, onTap: (() -> Void)? = nil) {
        self.title = title
        self.fontSize = fontSize
        self.type = type
        self.onTap = onTap
    }
    
    private func getTextColor() -> Color {
        switch type {
        case .loud:
            return .white
        case .quiet:
            return .init(.sRGB, red: 89/255, green: 136/255, blue: 219/255, opacity: 1)
        case .custom(_, _, let textColor):
            return textColor
        }
    }
    
    private func getBackgroundColor() -> Color {
        switch type {
        case .loud:
            return .init(.sRGB, red: 100/255, green: 145/255, blue: 223/255, opacity: 1)
        case .quiet:
            return .init(.sRGB, red: 232/255, green: 240/255, blue: 255/255, opacity: 1)
        case .custom(let backgroundColor, _, _):
            return backgroundColor
        }
    }
    
    private func getOnPressedBackgroundColor() -> Color {
        switch type {
        case .loud:
            return .init(.sRGB, red: 89/255, green: 136/255, blue: 219/255, opacity: 1)
        case .quiet:
            return .init(.sRGB, red: 167/255, green: 195/255, blue: 246/255, opacity: 1)
        case .custom(_, let onPressedColor, _):
            return onPressedColor
        }
    }
    
    public var body: some View {
        PYTextView(title, fontSize: fontSize, textColor: getTextColor(), weight: .medium)
            .onTapGesture {
                onTap?()
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        withAnimation(.easeIn(duration: 0.1)) {
                            isBeingPressed = true
                        }
                    })
                    .onEnded({ _ in
                        isBeingPressed = false
                    })
            )
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(isBeingPressed ? getOnPressedBackgroundColor() : getBackgroundColor())
            .cornerRadius(4)
    }
}

extension PYButtonView: PYView {
    static var identifier: String {
        "btn"
    }
}
