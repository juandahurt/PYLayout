//
//  PYStoryView.swift
//  
//
//  Created by Juan Hurtado on 15/05/22.
//

import SwiftUI
import Kingfisher

public struct PYStoryView: View {
    @State var currentIndex: Int = 0
    
    let stories: [PYStoryData]
    
    public init(stories: [PYStoryData]) {
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
        ZStack {
            KFImage.url(stories[currentIndex].image)
                .placeholder({ _ in
                    ProgressView()
                })
                .resizable()
            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.35)]), startPoint: .top, endPoint: .center)
            VStack {
                Spacer()
                HStack {
                    PYTextView(stories[currentIndex].title, fontSize: 16, textColor: .white, weight: .medium)
                    Spacer()
                }
                HStack {
                    PYTextView(stories[currentIndex].subtitle, fontSize: 12, textColor: .white)
                    Spacer()
                }
            }.padding()
            VStack {
                indicators
                Spacer()
            }
                .padding(5)
            GeometryReader { geometry in
                HStack {
                    Color.gray
                        .opacity(0.001)
                        .frame(width: geometry.size.width * 0.4)
                        .onTapGesture {
                            back()
                        }
                    Spacer()
                    Color.gray // When opacity = 0 or the color is `clear`, tap gesture doesn't work :c
                        .opacity(0.001)
                        .frame(width: geometry.size.width * 0.4)
                        .onTapGesture {
                            next()
                        }
                }
                
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.33)
        
    }
}
