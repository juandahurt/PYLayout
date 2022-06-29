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
    @State var hasDraggedTheImage = false
    @State var dragInitialTime: Date?
    
    @GestureState var scale: CGFloat = 1
    
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
                        hasDraggedTheImage = true
                        if scale == 1 {
                            if dragInitialTime == nil {
                                dragInitialTime = Date()
                            }
                            let translation = value.translation.height
                            dragOffset.height = translation
                            backgroundOpacity = 1 - abs(translation) * 0.001
                        }
                    }
                    .onEnded { value in
                        if scale == 1 {
                            let diff = differenceBeetwenInitialDragTime(and: Date())
                            if diff <= 150 || abs(dragOffset.height) >= UIScreen.main.bounds.height * 0.4  {
                                hideView()
                            } else {
                                withAnimation {
                                    backgroundOpacity = 1
                                }
                                dragOffset = .zero
                            }
                            dragInitialTime = nil
                        }
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .updating($scale, body: { value, state, _ in
                        guard value > 0.7 else { return }
                        state = value
                    })
            )
    }
    
    var image: some View {
        PuraceImageView(url: url)
            .scaledToFit()
            .offset(x: dragOffset.width, y: dragOffset.height)
            .animation(hasDraggedTheImage ? .easeOut(duration: 0.35) : .none)
            .scaleEffect(scale)
            .frame(maxHeight: maximumImageHeight)
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
                .opacity(backgroundOpacity)
            image
            draggableArea
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.opacity.animation(.linear))
    }
}

extension PuraceImageViewer {
    private func hideImage() {
        withAnimation {
            if dragOffset.height > 0 {
                dragOffset.height = UIScreen.main.bounds.height
            } else {
                dragOffset.height = -UIScreen.main.bounds.height
            }
        }
    }
    
    private func hideView() {
        hideImage()
        withAnimation {
            backgroundOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            isVisible = false
        }
    }
}
