//
//  PuraceButtonView.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation
import SwiftUI

public struct PuraceButtonView: View {
    @State var backgroundColor: Color = .blue
    @State var isBeingPressed = false
    
    let title: String
    let fontSize: Int
    let type: PuraceButtonType
    let onTap: (() -> Void)?
    
    public init(_ title: String, fontSize: Int = 12, type: PuraceButtonType = .loud, onTap: (() -> Void)? = nil) {
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
            return PuraceStyle.Color.B1
        case .custom(_, _, let textColor):
            return textColor
        }
    }
    
    private func getBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.B2
        case .quiet:
            return PuraceStyle.Color.B5
        case .custom(let backgroundColor, _, _):
            return backgroundColor
        }
    }
    
    private func getOnPressedBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.B1
        case .quiet:
            return PuraceStyle.Color.B4
        case .custom(_, let onPressedColor, _):
            return onPressedColor
        }
    }
    
    public var body: some View {
        PuraceTextView(title, fontSize: fontSize, textColor: getTextColor(), weight: .medium)
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
