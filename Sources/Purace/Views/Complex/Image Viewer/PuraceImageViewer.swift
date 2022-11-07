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
    let urls: [URL?]
    @State var currentIndex: Int
    @GestureState var scale: CGFloat = 1
    @State var dragOffset: CGFloat = .zero
    @State var backgroundOpacity = 1.0
    @State var userHasDropped = true
    private let numberOfImages: Int
    
    private let maximumImageHeight = UIScreen.main.bounds.height * 0.65
    
    public init(urls: [URL?], isVisible: Binding<Bool>, index: Int = 0) {
        self.urls = urls
        self._isVisible = isVisible
        self._currentIndex = .init(initialValue: index)
        self.numberOfImages = urls.count
    }
    
    var indicator: some View {
        HStack {
            if numberOfImages > 1 {
                PuraceTextView("\(currentIndex + 1)/\(numberOfImages)", fontSize: 14, textColor: .white, weight: .medium)
                    .padding(.trailing)
            }
        }
    }
    
    var backButton: some View {
        Image(systemName: "chevron.left")
            .foregroundColor(.white)
            .scaleEffect(1.2)
            .padding()
            .highPriorityGesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            isVisible = false
                        }
                    }
            )
    }
    
    var topBar: some View {
        VStack {
            HStack(alignment: .center) {
                backButton
                
                Spacer()
                
                indicator
            }.frame(height: 60)
                .opacity((abs(dragOffset) >= .zero && abs(dragOffset) <= 5 && userHasDropped) ? 1 : 0.0002)
        }
    }
    
    var viewer: some View {
        VStack(spacing: 0) {
            topBar
            
            TabView(selection: $currentIndex) {
                ForEach(0..<numberOfImages, id: \.self) { index in
                    PuraceImageView(url: urls[index])
                        .scaledToFit()
                        .tag(index)
                        .scaleEffect(scale)
                        .offset(y: dragOffset)
                        .gesture(
                            MagnificationGesture()
                                .updating($scale) { value, scale, _ in
                                    if value >= 0.9 {
                                        scale = value
                                    }
                                }
                        )
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation.height
                        if abs(dragOffset) > 5 {
                            let screenHeight = UIScreen.main.bounds.height
                            let progress = abs(dragOffset) / screenHeight / 2
                            withAnimation {
                                backgroundOpacity = 1 - progress
                                userHasDropped = false
                            }
                        }
                    }
                    .onEnded { _ in
                        if abs(dragOffset) < 200 {
                            withAnimation {
                                dragOffset = 0
                                backgroundOpacity = 1
                                userHasDropped = true
                            }
                        } else {
                            withAnimation {
                                isVisible = false
                            }
                        }
                    }
            )
                .onChange(of: currentIndex) { _ in
                    dragOffset = .zero
                }
                
        }.background(
            PuraceStyle.Color.X1
                .edgesIgnoringSafeArea(.all)
                .opacity(backgroundOpacity)
        )
    }
    
    public var body: some View {
        viewer
    }
}
