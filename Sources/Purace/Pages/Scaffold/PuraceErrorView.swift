//
//  PuraceErrorView.swift
//  
//
//  Created by Juan Hurtado on 15/12/22.
//

import SwiftUI

struct PuraceErrorView: View {
    var onRetryTap: (() -> Void)?
    
    var body: some View {
        GeometryReader { _ in
            HStack {
                Spacer(minLength: 0)
                
                VStack(alignment: .center) {
                    Spacer(minLength: 0)
                    Image("error", bundle: .module)
                    VStack(alignment: .center, spacing: 17) {
                        PuraceTextView("Ups", fontSize: 22, weight: .medium)
                        PuraceTextView("Parece que ha ocurrido un error. No te preocupes, es nuestra culpa.", fontSize: 14, textColor: PuraceStyle.Color.N2)
                            .multilineTextAlignment(.center)
                        HStack(spacing: 3) {
                            PuraceTextView("Código:", textColor: PuraceStyle.Color.N4)
                            PuraceTextView("12", weight: .medium)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    Spacer(minLength: 0)
                    if let onRetryTap {
                        PuraceButtonView("Reintentar") {
                            onRetryTap()
                        }
                    }
                    Spacer(minLength: 0)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 50)
        }.background(PuraceStyle.Color.F1)
    }
}

// MARK: - View modifier
struct PuraceErrorViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    var retryCallback: (() -> Void)?
    
    func body(content: Content) -> some View {
        Group {
            if isPresented {
                PuraceErrorView(onRetryTap: retryCallback)
            } else {
                content
            }
        }
    }
}


// MARK: - Scaffold extension
public extension PuraceScaffoldContent {
    func genericErrorView(isPresented: Binding<Bool>, retryCallback: (() -> Void)? = nil) -> some View {
        let errorModifier = PuraceErrorViewModifier(isPresented: isPresented, retryCallback: retryCallback)
        return modifier(errorModifier)
    }
}
