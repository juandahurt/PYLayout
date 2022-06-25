//
//  PuraceImageViewer.swift
//  
//
//  Created by Juan Hurtado on 25/06/22.
//

import Foundation
import SwiftUI

public struct PuraceImageViewer: View {
    @Binding var isVisible: Bool
    let backgroundColor: Color
    let url: URL?
    @State var opacity: Double = 0
    @State var dragOffset: CGFloat = .zero
    @State var backgroundOpacity: Double = 1
    @State var hasDroppedTheImage = false
    @State var dragInitialTime: Date?
    
    public init(url: URL?, isVisible: Binding<Bool>) {
        let colors: [Color] = [
            PuraceStyle.Color.X1,
            PuraceStyle.Color.X2,
            PuraceStyle.Color.X3,
            PuraceStyle.Color.X4
        ]
        backgroundColor = colors.randomElement()!
        self.url = url
        self._isVisible = isVisible
    }
    
    private func differenceBeetwenInitialDragTime(and date: Date) -> Double {
        guard let dragInitialTime = dragInitialTime else {
            return .zero
        }
        return date.timeIntervalSince(dragInitialTime) * 1000
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
                            if dragInitialTime == nil {
                                dragInitialTime = Date()
                            }
                            let translation = value.translation.height
                            dragOffset = translation
                            backgroundOpacity = 1 - abs(translation) * 0.001
                        }
                        .onEnded { value in
                            let diff = differenceBeetwenInitialDragTime(and: Date())
                            if diff <= 150 {
                                let translation = value.translation.height
                                withAnimation {
                                    let screenHeight = UIScreen.main.bounds.height * 0.65
                                    dragOffset = translation > 0 ? screenHeight : -screenHeight
                                }
                                isVisible = false
                            } else {
                                withAnimation {
                                    backgroundOpacity = 1
                                }
                                hasDroppedTheImage = true
                                dragOffset = .zero
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                    hasDroppedTheImage = false
                                }
                            }
                            dragInitialTime = nil
                        }
                )
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
        .onChange(of: $isVisible.wrappedValue) { value in
            if value {
                dragOffset = 0
                backgroundOpacity = 1
                withAnimation {
                    opacity = 1
                }
            } else {
                withAnimation {
                    backgroundOpacity = 0
                    opacity = 0
                }
            }
        }
        .opacity(opacity)
    }
}
