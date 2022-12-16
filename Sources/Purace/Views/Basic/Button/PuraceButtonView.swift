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
    let type: PuraceButtonType
    let size: PuraceButtonSize
    let onTap: (() -> Void)?
    
    public init(_ title: String, size: PuraceButtonSize = .medium, type: PuraceButtonType = .loud, onTap: (() -> Void)? = nil) {
        self.title = title
        self.type = type
        self.size = size
        self.onTap = onTap
    }
    
    public var body: some View {
        Button(title) {
            onTap?()
        }
        .font(PuraceStyle.Font.get(size: CGFloat(size.rawValue), weight: .medium))
        .buttonStyle(PuraceButtonStyle(type: type))
    }
}

struct PuraceButtonStyle: ButtonStyle {
    let type: PuraceButtonType
    
    private func getBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.N2
        case .quiet:
            return .clear
        }
    }
    
    private func getTextColor() -> Color {
        switch type {
        case .loud:
            return .white
        case .quiet:
            return PuraceStyle.Color.N1
        }
    }
    
    private func getOnPressedBackgroundColor() -> Color {
        switch type {
        case .loud:
            return PuraceStyle.Color.N1
        case .quiet:
            return PuraceStyle.Color.N8
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(.vertical, 4)
            .background(configuration.isPressed ? getOnPressedBackgroundColor() : getBackgroundColor())
            .foregroundColor(getTextColor())
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(lineWidth: 1)
                    .foregroundColor(PuraceStyle.Color.N2)
            )
    }
}
