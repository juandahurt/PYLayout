//
//  PYCollectionCardView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import Kingfisher
import SwiftUI

public struct PYCollectionCardView: View {
    @State var image = UIImage()
    @State var dragOffset: CGSize = .zero
    @State var dragOpacity: Double = 1
    
    private let firstCardSize = CGSize(width: 250, height: 300)
    
    @State var cards: [PYCollectionCardData]
    let numberOfCards: Int
    
    public init(cards: [PYCollectionCardData]) {
        self.cards = cards
        self.numberOfCards = cards.count
    }
    
    func next() {
        let card = cards.popLast()!
        cards.insert(card, at: 0)
    }
    
    func getSize(at index: Int) -> CGSize {
        guard index != numberOfCards - 1 else {
            return firstCardSize
        }
        return CGSize(
            width: firstCardSize.width - CGFloat(numberOfCards - index) * 10,
            height: firstCardSize.height - CGFloat(numberOfCards - index) * 10
        )
    }
    
    func getShadowOpacity(forViewAt index: Int) -> Double {
        guard index != numberOfCards - 1 else {
            return 0
        }
        guard index != numberOfCards - 2 else {
            if dragOpacity > 1.0 - 1.0 / Double(numberOfCards - index) {
                return 1.0 - 1.0 / Double(numberOfCards - index)
            } else {
                return dragOpacity
            }
        }
        return 1.0 - 1.0 / Double(numberOfCards - index)
    }
    
    func card(at index: Int) -> some View {
        ZStack(alignment: .center) {
            KFImage.url(cards[index].backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Color.white.opacity(getShadowOpacity(forViewAt: index))
        }
        .frame(width: getSize(at: index).width, height: getSize(at: index).height)
        .cornerRadius(5)
        .opacity(index == cards.count - 1 ? dragOpacity : 1)
        .offset(x: CGFloat(index == numberOfCards - 1 ? 0 : (numberOfCards - index) * 10) , y: 0)
        .offset(x: index == numberOfCards - 1 ? dragOffset.width : .zero, y: .zero)
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .onChanged({ value in
                    if value.translation.width < 0 && index == numberOfCards - 1 {
                        dragOffset = value.translation
                        dragOpacity = (-1/value.translation.width) * 20
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
                ForEach(0..<numberOfCards) { index in
                    card(at: index)
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: 300)
    }
}
