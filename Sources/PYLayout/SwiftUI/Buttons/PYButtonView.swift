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
    
    let type: PYButtonType
    
    public init(type: PYButtonType = .loud) {
        self.type = type
    }
    
    private func getTextColor() -> Color {
        switch type {
        case .loud:
            return .white
        case .quiet:
            return .blue
        }
    }
    
    public var body: some View {
        PYTextView("Ver todos", fontSize: 12, textColor: getTextColor(), weight: .medium)
            .onTapGesture {
                print("asdf")
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        withAnimation(.easeIn(duration: 0.2)) {
                            backgroundColor = .gray
                        }
                    })
                    .onEnded({ _ in
                        backgroundColor = .blue
                    })
            )
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(backgroundColor)
            .cornerRadius(4)
    }
}
