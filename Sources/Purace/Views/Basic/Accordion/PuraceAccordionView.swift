//
//  PuraceAccordionView.swift
//  
//
//  Created by Juan Hurtado on 13/06/22.
//

import Foundation
import SwiftUI

public struct PuraceAccordionView: View {
    private let closeColor = Color.white
    private let openColor = PuraceStyle.Color.G8
    
    private let openForegroundColor = PuraceStyle.Color.N1
    private let closeForegroundColor = PuraceStyle.Color.G1
    
    @State var isOpen = false
    @State var rotation: CGFloat = 270
    
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    var header: some View {
        HStack {
            PuraceTextView(title, fontSize: 14, weight: .medium)
            Spacer()
            Image(systemName: "chevron.left")
                .foregroundColor(isOpen ? openForegroundColor : closeForegroundColor)
                .rotationEffect(.degrees(rotation))
        }
        .padding(.vertical)
        .padding(.horizontal, 16)
        .background(
            ZStack(alignment: .bottom) {
                isOpen ? openColor : closeColor
                Divider()
            }
        )
        .onTapGesture {
            withAnimation(.linear(duration: 0.15)) {
                isOpen = !isOpen
                rotation = isOpen ? 90 : 270
            }
        }
    }
    
    public var body: some View {
        VStack {
            header
        }
    }
}
