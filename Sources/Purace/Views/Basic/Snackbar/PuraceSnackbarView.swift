//
//  PuraceSnackbarView.swift
//  
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import PopupView
import SwiftUI

struct PuraceSnackbarView: View {
    @Binding var isVisible: Bool
    let title: String
    let type: PuraceSnackbarType
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
        HStack {
            PuraceTextView(title, textColor: .white)
            Spacer()
            if let buttonTitle = buttonTitle {
                PuraceTextView(buttonTitle, textColor: .white, weight: .medium)
                    .onTapGesture {
                        buttonOnTap?()
                        isVisible = false
                    }
            }
        }
            .lineLimit(2)
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(getBackgroundColor())
    }
}


struct PuraceSnackbarViewModifier: ViewModifier {
    @Binding var isVisible: Bool
    var title: String
    var buttonTitle: String?
    var type: PuraceSnackbarType
    var buttonOnTap: (() -> Void)?
    var duration: PuraceSnackbarDuration
    var dismissOnDrag = false
    var closeOnTap = false
    
    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .popup(isPresented: $isVisible, type: .toast, autohideIn: Double(duration.rawValue), dragToDismiss: dismissOnDrag, closeOnTap: closeOnTap) {
            PuraceSnackbarView(title: title, type: type, isVisible: $isVisible, buttonTitle: buttonTitle, buttonOnTap: buttonOnTap)
        }
    }
}

public enum PuraceSnackbarDuration: String {
    case short = "2.0"
    case long = "3.5"
    case endless = ""
}

public extension View {
    func snackBar(title: String, isVisible: Binding<Bool>, type: PuraceSnackbarType = .info, buttonTitle: String? = nil, duration: PuraceSnackbarDuration = .endless, dismissOnDrag: Bool = false, closeOnTap: Bool = false, buttonOnTap: (() -> Void)? = nil) -> some View {
        modifier(PuraceSnackbarViewModifier(isVisible: isVisible, title: title, buttonTitle: buttonTitle, type: type, buttonOnTap: buttonOnTap, duration: duration, dismissOnDrag: dismissOnDrag, closeOnTap: closeOnTap))
    }
}
