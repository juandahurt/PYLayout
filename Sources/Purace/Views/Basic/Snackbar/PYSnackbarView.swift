//
//  PYSnackbarView.swift
//  
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import SwiftUI

public struct PYSnackbarView: View {
    @State var yOffset: CGFloat = 100
    @State var opacity: Double = 0
    
    let title: String
    let type: PYSnackbarType
    @Binding var isVisible: Bool
    let buttonTitle: String?
    let buttonOnTap: (() -> Void)?
    
    public init(title: String, type: PYSnackbarType = .info, isVisible: Binding<Bool>, buttonTitle: String? = nil, buttonOnTap: (() -> Void)? = nil) {
        self.title = title
        self.type = type
        self._isVisible = isVisible
        self.buttonTitle = buttonTitle
        self.buttonOnTap = buttonOnTap
    }
    
    private func getBackgroundColor() -> Color {
        switch type {
        case .info:
            return PuraceStyle.Color.G1
        case .alert:
            return PuraceStyle.Color.B1
        }
    }
    
    public var body: some View {
        HStack {
            PYTextView(title, fontSize: 14, textColor: .white)
            Spacer()
            if let buttonTitle = buttonTitle {
                PYButtonView(buttonTitle, fontSize: 14, type: .custom(.clear, .clear, .white)) {
                    buttonOnTap?()
                }
            }
        }
            .lineLimit(2)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(getBackgroundColor())
            .cornerRadius(5)
            .onChange(of: isVisible, perform: { isPresented in
                withAnimation(.spring()) {
                    yOffset = isPresented ? 0 : 100
                    opacity = isPresented ? 1 : 0
                }
            })
            .opacity(opacity)
            .offset(x: 0, y: yOffset)
    }
}
