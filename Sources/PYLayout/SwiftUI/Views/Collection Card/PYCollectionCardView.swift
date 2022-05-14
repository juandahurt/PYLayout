//
//  PYCollectionCardView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import SwiftUI

public struct PYCollectionCardView: View {
    @State var image = UIImage()
    @State var dragOffset: CGSize = .zero
    @State var dragOpacity: Double = 1
    
    let firstCardSize = CGSize(width: 250, height: 300)
    
    // TODO: Remove mock data
    @State var cards = [
        Color.blue,
        Color.red,
        Color.green,
        Color.black,
    ]
    
    public init() {}
    
    func next() {
        let card = cards.popLast()!
        cards.insert(card, at: 0)
    }
    
    func getSize(at index: Int) -> CGSize {
        guard index != cards.count - 1 else {
            return firstCardSize
        }
        return CGSize(
            width: firstCardSize.width - CGFloat(cards.count - index) * 10,
            height: firstCardSize.height - CGFloat(cards.count - index) * 10
        )
    }
    
    func getShadowOpacity(forViewAt index: Int) -> Double {
        guard index != cards.count - 1 else {
            return 0
        }
        guard index != cards.count - 2 else {
            if dragOpacity > 1.0 - 1.0 / Double(cards.count - index) {
                return 1.0 - 1.0 / Double(cards.count - index)
            } else {
                return dragOpacity
            }
        }
        return 1.0 - 1.0 / Double(cards.count - index)
    }
    
    func card(index: Int, color: Color) -> some View {
        ZStack(alignment: .center) {
            color
            Image(uiImage: image)
            Color.white.opacity(getShadowOpacity(forViewAt: index))
        }
        .frame(width: getSize(at: index).width, height: getSize(at: index).height)
        .cornerRadius(5)
        .opacity(index == cards.count - 1 ? dragOpacity : 1)
        .offset(x: CGFloat(index == cards.count - 1 ? 0 : (cards.count - index) * 10) , y: 0)
        .offset(x: index == cards.count - 1 ? dragOffset.width : .zero, y: .zero)
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .onChanged({ value in
                    if value.translation.width < 0 && index == cards.count - 1 {
                        dragOffset = value.translation
                        dragOpacity = (-1/value.translation.width) * 10
                    } else if value.translation.width >= 0 {
                        dragOpacity = 1
                    }
                })
                .onEnded({ value in
                    if dragOpacity < 0.4 {
                        next()
                    }
                    dragOpacity = 1
                    dragOffset = .zero
                })
        )
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            ZStack(alignment: .trailing) {
                ForEach(cards.indices) { index in
                    card(index: index, color: cards[index])
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: 300)
        
    }
}
