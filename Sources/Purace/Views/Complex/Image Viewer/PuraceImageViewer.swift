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
        Button {
            isVisible = false
        } label: {
            Image("arrow_back", bundle: Bundle.module)
        }
        .buttonStyle(.plain)
            .padding(.leading)
    }
    
    var topBar: some View {
        HStack {
            backButton
            
            Spacer()
            
            indicator
        }
    }
    
    var viewer: some View {
        VStack {
            topBar
            
            Spacer()
            
            TabView(selection: $currentIndex) {
                ForEach(0..<numberOfImages) { index in
                    PuraceImageView(url: urls[index])
                        .scaledToFit()
                        .tag(index)
                        .padding(.horizontal, 5)
                        .scaleEffect(scale)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .gesture(
                MagnificationGesture()
                    .updating($scale) { value, scale, _ in
                        if value >= 0.9 {
                            scale = value
                        }
                    }
            )
            
            Spacer()
        }.background(
            PuraceStyle.Color.X1
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    public var body: some View {
        viewer
    }
}
