//
//  PuraceStoryView.swift
//  
//
//  Created by Juan Hurtado on 15/05/22.
//

import SwiftUI
import Kingfisher

public struct PuraceStoryView: View {
    @State var currentIndex: Int = 0
    
    let stories: [PuraceStoryData]
    
    public init(stories: [PuraceStoryData]) {
        self.stories = stories
    }
    
    var indicators: some View {
        HStack(spacing: 3) {
            ForEach(stories.indices) { index in
                Color.white.opacity(index <= currentIndex ? 0.8 : 0.3)
                    .cornerRadius(1)
            }
        }.frame(height: 5)
    }
    
    private func next() {
        guard currentIndex < stories.count - 1 else { return }
        currentIndex += 1
    }
    
    private func back() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
    }
    
    public var body: some View {
        GeometryReader { outterReader in
            ZStack {
                PuraceImageView(url: stories[currentIndex].image)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: outterReader.size.width)
                Color.black.opacity(0.3)
                VStack(spacing: 8) {
                    Spacer()
                    HStack {
                        PuraceTextView(stories[currentIndex].title, fontSize: 18, textColor: .white, weight: .medium)
                        Spacer()
                    }
                    HStack {
                        PuraceTextView(stories[currentIndex].subtitle, fontSize: 14, textColor: .white)
                        Spacer()
                    }
                }.padding()
                VStack {
                    indicators
                    Spacer()
                }
                    .padding(5)
                GeometryReader { innerReader in
                    HStack {
                        Color.gray
                            .opacity(0.001)
                            .frame(width: innerReader.size.width * 0.4)
                            .onTapGesture {
                                back()
                            }
                        Spacer()
                        Color.gray // When opacity = 0 or the color is `clear`, tap gesture doesn't work :c
                            .opacity(0.001)
                            .frame(width: innerReader.size.width * 0.4)
                            .onTapGesture {
                                next()
                            }
                    }
                    
                }
            }
        }
    }
}
