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
    @State var dragOffset: CGSize = .zero
    @State var backgroundOpacity: Double = 1
    @State var hasDroppedTheImage = false
    @State var dragInitialTime: Date?
    
    @State var currentScale: CGFloat = 1
    @State var finalScale: CGFloat = 1 // zoom
    
    @State var dragAccumulator: CGSize = .zero
    @State var imageSize: CGSize = .zero
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
                        } else {
//                            dragOffset.width += value.translation.width + dragAccumulator.width
//                            dragOffset.width *= 1/currentScale
//                            dragOffset.height += value.translation.height + dragAccumulator.width
//                            dragOffset.height *= 1/currentScale
                        }
                    }
                    .onEnded { value in
                        if currentScale == 1 {
                            let diff = differenceBeetwenInitialDragTime(and: Date())
                            if diff <= 150 {
                                let translation = value.translation.height
                                withAnimation {
                                    let screenHeight = UIScreen.main.bounds.height * 0.65
                                    dragOffset.height = translation > 0 ? screenHeight : -screenHeight
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
                        } else {
                            dragAccumulator.width += value.translation.width
                            dragAccumulator.height += value.translation.height
                        }
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .onChanged { value in
                        guard value < 3.5 else { return }
                        let aux = max(0.6, value)
                        if value > 1 {
                            if aux < finalScale {
                                currentScale = finalScale
                            } else {
                                currentScale = aux
                            }
                        } else {
                            currentScale = aux
                        }
                    }
                    .onEnded { value in
                        if value < 1 {
                            currentScale = 1
                            finalScale = 1
                        } else {
                            finalScale = currentScale
                        }
                    }
            )
    }
    
    var image: some View {
        PuraceImageView(url: url)
            .scaledToFit()
            .offset(x: dragOffset.width, y: dragOffset.height)
            .animation(hasDroppedTheImage ? .easeOut(duration: 0.35) : .none)
            .scaleEffect(currentScale)
            .overlay(
                GeometryReader { reader in
                    Color.black.opacity(0.001)
                        .onAppear {
                            updateImageSize(from: reader.size)
                        }
                }
            )
        .frame(maxHeight: maximumImageHeight)
    }
    
    func updateImageSize(from size: CGSize) {
        imageSize = size
        print(size)
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
                .opacity(backgroundOpacity)
            image
            draggableArea
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
        .onChange(of: $isVisible.wrappedValue) { value in
            if value {
                dragOffset = .zero
                dragAccumulator = .zero
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
