//
//  PuraceSnackbarView.swift
//  
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import SwiftUI

struct PuraceSnackbarView: View {
    @State var yOffset: CGFloat = 100
    @State var opacity: Double = 0
    
    let title: String
    let type: PuraceSnackbarType
    @State var isVisibleAux: Bool = true
    @Binding var isVisible: Bool
    let buttonTitle: String?
    let buttonOnTap: (() -> Void)?
    
    init(title: String, type: PuraceSnackbarType = .info, isVisible: Binding<Bool>, buttonTitle: String? = nil, buttonOnTap: (() -> Void)? = nil) {
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
        case .error:
            return PuraceStyle.Color.R1
        }
    }
    
    public var body: some View {
        VStack {
            Spacer()
            HStack {
                PuraceTextView(title, fontSize: 14, textColor: .white)
                Spacer()
                if let buttonTitle = buttonTitle {
                    PuraceButtonView(buttonTitle, fontSize: 14, type: .custom(.clear, .clear, .white)) {
                        buttonOnTap?()
                        isVisible = false
                    }
                }
            }
                .lineLimit(2)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(getBackgroundColor())
                .cornerRadius(5)
                .onChange(of: isVisible, perform: { _ in
                    withAnimation(.spring()) {
                        yOffset = 100
                        opacity = 0
                    }
                })
                .opacity(opacity)
                .offset(x: 0, y: yOffset)
                .onAppear {
                    withAnimation(.spring()) {
                        yOffset = 0
                        opacity = 1
                    }
                }
        }
    }
}


struct PuraceSnackbarViewModifier: ViewModifier {
    @Binding var isVisible: Bool
    @State var isVisibleAux = false
    var title: String
    var buttonTitle: String?
    var type: PuraceSnackbarType
    var buttonOnTap: (() -> Void)?
    var onDissappear: (() -> Void)?
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isVisibleAux {
                PuraceSnackbarView(title: title, type: type, isVisible: $isVisible, buttonTitle: buttonTitle, buttonOnTap: buttonOnTap)
                    .onDisappear {
                        onDissappear?()
                    }
            }
        }.onChange(of: isVisible) { newValue in
            if !newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    isVisibleAux = newValue
                }
            } else {
                isVisibleAux = newValue
            }
        }
    }
}


public extension View {
    func snackBar(title: String, isVisible: Binding<Bool>, type: PuraceSnackbarType = .info, buttonTitle: String? = nil, buttonOnTap: (() -> Void)? = nil, onDissappear: (() -> Void)? = nil) -> some View {
        modifier(PuraceSnackbarViewModifier(isVisible: isVisible, title: title, buttonTitle: buttonTitle, type: type, buttonOnTap: buttonOnTap, onDissappear: onDissappear))
    }
}
