//
//  PuraceTabView.swift
//  
//
//  Created by Juan Hurtado on 1/06/22.
//

import Foundation
import SwiftUI

public struct PuraceTabView<T: View>: View {
    let titles: [String]
    @State var selectedIndex = 0
    @State var indicatorOffset: CGFloat = .zero
    var viewForIndex: (Int) -> T
    
    public init(titles: [String], viewForIndex: @escaping (Int) -> T) {
        self.titles = titles
        self.viewForIndex = viewForIndex
    }
    
    func headers(in size: CGSize) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<titles.count, id: \.self) { index in
                PuraceTextView(titles[index], fontSize: 12, textColor: selectedIndex == index ? PuraceStyle.Color.N1 : PuraceStyle.Color.N4, weight: selectedIndex == index ? .medium : .regular)
                    .frame(width: size.width / CGFloat(titles.count))
                    .background(Color.gray.opacity(0.001))
                    .onTapGesture {
                        selectedIndex = index
                        updateIndicatorOffset(size: size)
                    }
            }
        }.frame(height: 50)
    }
    
    func indicator(in size: CGSize) -> some View {
        ZStack {
            Color.black
                .frame(height: 1)
                .opacity(0.1)
            HStack {
                PuraceStyle.Color.G2
                    .frame(width: size.width / CGFloat(titles.count), height: 3)
                Spacer(minLength: 0)
            }.offset(x: indicatorOffset, y: 0)
        }
    }
    
    func updateIndicatorOffset(size: CGSize) {
        withAnimation(.linear(duration: 0.2)) {
            indicatorOffset = CGFloat(selectedIndex) * size.width / CGFloat(titles.count)
        }
    }
    
    public var body: some View {
        GeometryReader { reader in
            VStack(spacing: 0) {
                headers(in: reader.size)
                indicator(in: reader.size)
                ZStack {
                    ForEach(0..<titles.count, id: \.self) { index in
                        viewForIndex(index)
                            .opacity(index == selectedIndex ? 1 : 0)
                    }
                }.clipped()
                    .contentShape(Rectangle())
            }
        }
    }
}
