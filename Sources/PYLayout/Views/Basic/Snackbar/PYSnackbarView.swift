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
    @Binding var isVisible: Bool
    
    public init(title: String, isVisible: Binding<Bool>) {
        self.title = title
        self._isVisible = isVisible
    }
    
    public var body: some View {
        HStack {
            PYTextView(title, fontSize: 14, textColor: .white)
            Spacer()
        }
            .lineLimit(2)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color.blue)
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
