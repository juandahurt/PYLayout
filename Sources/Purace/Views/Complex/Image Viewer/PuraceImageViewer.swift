//
//  PuraceImageViewer.swift
//  
//
//  Created by Juan Hurtado on 25/06/22.
//

import Foundation
import SwiftUI
import Kingfisher

public struct PuraceImageViewer: View {
    @Binding var isVisible: Bool
    let backgroundColor: Color
    let url: URL?
    @State var opacity: Double = 0
    @State var dragOffset: CGSize = .zero
    @State var backgroundOpacity: Double = 1
    @State var hasDroppedTheImage = false
    @State var dragInitialTime: Date?
    
    @State var currentScale: CGFloat = 1
    @State var finalScale: CGFloat = 1
    
    @State var isImageVisible = true
    
    @State var dragAnimationDuration: Double = 0
    
    private let maximumImageHeight = UIScreen.main.bounds.height * 0.65
    
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
    
    var draggableArea: some View {
        Color.black
            .animation(.none)
            .opacity(0.001)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if currentScale == 1 {
                            if dragInitialTime == nil {
                                dragInitialTime = Date()
                            }
                            let translation = value.translation.height
                            dragOffset.height = translation
                            backgroundOpacity = 1 - abs(translation) * 0.001
                        }
                    }
                    .onEnded { value in
                        if currentScale == 1 {
                            let diff = differenceBeetwenInitialDragTime(and: Date())
                            if diff <= 150 {
                                withAnimation {
                                    isImageVisible = false
                                }
                                isVisible = false
                            } else {
                                withAnimation {
                                    backgroundOpacity = 1
                                }
                                hasDroppedTheImage = true
                                dragOffset = .zero
                                dragAnimationDuration = 0.35
                            }
                            dragInitialTime = nil
                        }
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { value in
                        guard value > 0.6 else {
                            currentScale = 0.6
                            return
                        }
                        guard currentScale < 3.5 else {
                            currentScale = 3.5
                            return
                        }
                        if currentScale > 1 {
                            if value < finalScale {
                                if value < 1 {
                                    print(value, finalScale)
                                    currentScale = finalScale - 1 - value
                                } else {
                                    currentScale = finalScale + value - 1
                                }
                            } else {
                                if value < 1 {
                                    currentScale = value
                                } else {
                                    currentScale = value
                                }
                            }
                        } else {
                            currentScale = value
                        }
                    }
                    .onEnded { value in
                        if value < 1 {
                            withAnimation {
                                currentScale = 1
                            }
                            finalScale = 1
                        } else {
                            finalScale = currentScale
                        }
                    }
            )
            .simultaneousGesture(
                TapGesture(count: 2).onEnded {
                    withAnimation {
                        currentScale = 1
                    }
                    finalScale = 1
                }
            )
    }
    
    var image: some View {
        PuraceImageView(url: url)
            .scaledToFit()
            .offset(x: dragOffset.width, y: dragOffset.height)
            .animation(hasDroppedTheImage ? .easeOut(duration: 0.35) : .none)
            .scaleEffect(currentScale)
            .frame(maxHeight: maximumImageHeight)
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
                .opacity(backgroundOpacity)
            if isImageVisible {
                image
                    .transition(.move(edge: dragOffset.height > 0 ? .bottom : .top))
            }
            draggableArea
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.opacity.animation(.linear))
    }
}
