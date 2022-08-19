//
//  PuraceAdjustableHStack.swift
//  
//
//  Created by Juan Hurtado on 19/08/22.
//

import Foundation
import SwiftUI

public struct PuraceAdjustableHStack: View {
    @State var selectedIndex = 0
    @State var currentDragValue: CGFloat = .zero
    
    /// The amount of pixels that the user must drag to move around the elements.
    private let sensibility: CGFloat = 35
    
    var builder: (Int) -> (title: String, imageUrl: URL?)
    
    public init(builder: @escaping (Int) -> (String, URL?)) {
        self.builder = builder
    }
    
    func next() {
        guard selectedIndex < 3 else { return }
        guard currentDragValue < 0 else { return }
        selectedIndex += 1
    }
    
    func back() {
        guard selectedIndex > 0 else { return }
        guard currentDragValue > 0 else { return }
        selectedIndex -= 1
    }
    
    public var body: some View {
        GeometryReader { reader in
            HStack {
                ForEach(0..<4) { index in
                    ZStack(alignment: .bottomLeading) {
                        Color.clear
                            .background(
                                ZStack {
                                    PuraceImageView(url: builder(index).imageUrl)
                                        .scaledToFill()
                                    
                                    LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .bottom, endPoint: .top)
                                }
                            )
                        
                        if index == selectedIndex {
                            PuraceTextView(builder(index).title, fontSize: 14, textColor: .white, weight: .medium)
                                .padding()
                        }
                    }
                    .clipped()
                    .contentShape(Rectangle())
                    .frame(width: index == selectedIndex ? reader.size.width * 0.75 : nil)
                    .onTapGesture {
                        if index == selectedIndex {
                            
                        } else {
                            withAnimation(.spring()) {
                                selectedIndex = index
                            }
                        }
                    }
                    .cornerRadius(5)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 3)
                    .onChanged { value in
                        if currentDragValue == .zero {
                            if value.translation.width < sensibility {
                                currentDragValue = value.translation.width
                                withAnimation(.spring()) {
                                    back()
                                }
                                return
                            }
                            if value.translation.width > sensibility {
                                currentDragValue = value.translation.width
                                withAnimation(.spring()) {
                                    next()
                                }
                                return
                            }
                        } else {
                            if value.translation.width > currentDragValue + sensibility {
                                currentDragValue = value.translation.width
                                withAnimation(.spring()) {
                                    back()
                                }
                                return
                            }
                            if value.translation.width < currentDragValue - sensibility {
                                currentDragValue = value.translation.width
                                withAnimation(.spring()) {
                                    next()
                                }
                                return
                            }
                        }
                    }
                    .onEnded { _ in
                        currentDragValue = .zero
                    }
            )
        }
    }
}
