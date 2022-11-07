//
//  PuraceButtonView.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation
import SwiftUI

public struct PuraceButtonView: View {
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
    
    public var body: some View {
        Button(title) {
            onTap?()
        }
        .font(PuraceStyle.Font.get(size: CGFloat(fontSize), weight: .medium))
        .buttonStyle(PuraceButtonStyle(type: type))
    }
}

struct PuraceButtonStyle: ButtonStyle {
    let type: PuraceButtonType
    
    private func getBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.B2
        case .quiet:
            return PuraceStyle.Color.B5
        case .transparent:
            return .white.opacity(0.01)
        case .custom(let backgroundColor, _, _):
            return backgroundColor
        }
    }
    
    private func getTextColor() -> Color {
        switch type {
        case .loud:
            return .white
        case .quiet:
            return PuraceStyle.Color.B1
        case .transparent:
            return PuraceStyle.Color.B1
        case .custom(_, _, let textColor):
            return textColor
        }
    }
    
    private func getOnPressedBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.B1
        case .quiet:
            return PuraceStyle.Color.B4
        case .transparent:
            return PuraceStyle.Color.B5
        case .custom(_, let onPressedColor, _):
            return onPressedColor
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(configuration.isPressed ? getOnPressedBackgroundColor() : getBackgroundColor())
            .foregroundColor(getTextColor())
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
