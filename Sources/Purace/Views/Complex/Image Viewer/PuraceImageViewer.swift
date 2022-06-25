//
//  PuraceImageViewer.swift
//  
//
//  Created by Juan Hurtado on 25/06/22.
//

import Foundation
import SwiftUI

public struct PuraceImageViewer: View {
    var isVisible: Binding<Bool>
    let backgroundColor: Color
    let url: URL?
    @State var opacity: Double = 0
    @State var dragOffset: CGFloat = .zero
    @State var backgroundOpacity: Double = 1
    @State var hasDroppedTheImage = false
    
    public init(url: URL?, isVisible: Binding<Bool>) {
        let colors: [Color] = [
            PuraceStyle.Color.X1,
            PuraceStyle.Color.X2,
            PuraceStyle.Color.X3,
            PuraceStyle.Color.X4
        ]
        backgroundColor = colors.randomElement()!
        self.url = url
        self.isVisible = isVisible
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
                .opacity(backgroundOpacity)
            PuraceImageView(url: url)
                .scaledToFit()
                .frame(maxHeight: UIScreen.main.bounds.height * 0.75)
                .offset(x: 0, y: dragOffset)
                .animation(hasDroppedTheImage ? .easeOut(duration: 0.35) : .none)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let translation = value.translation.height
                            dragOffset = translation
                            backgroundOpacity = 1 - abs(translation) * 0.001
                        }
                        .onEnded { value in
                            withAnimation {
                                backgroundOpacity = 1
                            }
                            hasDroppedTheImage = true
                            dragOffset = .zero
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                hasDroppedTheImage = false
                            }
                        }
                )
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
        .onChange(of: isVisible.wrappedValue) { newValue in
            withAnimation {
                opacity = 1
            }
        }
        .opacity(opacity)
    }
}
