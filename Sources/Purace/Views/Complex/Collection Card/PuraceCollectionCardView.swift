//
//  PuraceCollectionCardView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import Kingfisher
import SwiftUI

public struct PuraceCollectionCardView: View {
    @State var image = UIImage()
    @State var dragOffset: CGSize = .zero
    @State var dragOpacity: Double = 1
    @State var lastCardOpacity: Double = 1
    
    private let firstCardSize: CGSize
    private let onCardTapped: ((PuraceCollectionCardData) -> Void)?
    
    @State var cards: [PuraceCollectionCardData]
    let numberOfCards: Int
    
    public init(firstCardSize: CGSize, cards: [PuraceCollectionCardData], onCardTapped: ((PuraceCollectionCardData) -> Void)? = nil) {
        self.firstCardSize = firstCardSize
        self.cards = cards
        self.numberOfCards = cards.count
        self.onCardTapped = onCardTapped
    }
    
    func next() {
        let card = cards.popLast()!
        cards.insert(card, at: 0)
    }
    
    func getSize(at index: Int) -> CGSize {
        guard index != numberOfCards - 1 else {
            return firstCardSize
        }
        let maxWidth: CGFloat
        let maxHeight: CGFloat
        if index == numberOfCards - 2 {
            maxWidth = firstCardSize.width
            maxHeight = firstCardSize.height
        } else {
            maxWidth = firstCardSize.width - CGFloat(numberOfCards - index - 1) * 10
            maxHeight = firstCardSize.height - CGFloat(numberOfCards - index - 1) * 10
        }
        let possibleWidth = firstCardSize.width - CGFloat(numberOfCards - index) * 10 - dragOffset.width * 0.1
        let possibleHeight = firstCardSize.height - CGFloat(numberOfCards - index) * 10 - dragOffset.width * 0.1
        return CGSize(
            width: min(possibleWidth, maxWidth),
            height: min(possibleHeight, maxHeight)
        )
    }
    
    func getCardOpacity(forCardAt index: Int) -> Double {
        guard index != cards.count - 1 else { return dragOpacity }
        guard index != 0 else { return lastCardOpacity }
        return 1
    }
    
    func getHorizontalOffset(forCardAt index: Int) -> CGFloat {
        guard index != numberOfCards - 1 else {
            return 0
        }
        let minOffset: CGFloat
        if index == numberOfCards - 2 {
            minOffset = 0
        } else {
            minOffset = CGFloat((numberOfCards - index - 1) * 15)
        }
        return max(CGFloat((numberOfCards - index) * 15) + dragOffset.width * 0.5, minOffset)
    }
    
    func card(at index: Int) -> some View {
        Group {
            if cards.isEmpty {
                EmptyView()
            } else {
                ZStack(alignment: .center) {
                    PuraceImageView(url: cards[index].backgroundImage)
                        .frame(width: getSize(at: index).width, height: getSize(at: index).height)
                        .aspectRatio(contentMode: .fill)
                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.35)]), startPoint: .top, endPoint: .center)
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            PuraceTextView(cards[index].title, fontSize: 12, textColor: .white, weight: .medium)
                            Spacer(minLength: 0)
                        }
                    }.padding()
                }
                .frame(width: getSize(at: index).width, height: getSize(at: index).height)
                .cornerRadius(5)
                .opacity(getCardOpacity(forCardAt: index))
                .offset(x: getHorizontalOffset(forCardAt: index), y: 0)
                .offset(x: index == numberOfCards - 1 ? dragOffset.width : .zero, y: .zero)
                .onTapGesture {
                    if index == numberOfCards - 1 {
                        // user can only touch the top card!
                        onCardTapped?(cards[index])
                    }
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 10, coordinateSpace: .global)
                        .onChanged({ value in
                            if value.translation.width < 20 && index == numberOfCards - 1 {
                                dragOffset = value.translation
                                if value.translation.width >= 0 {
                                    dragOpacity = 1
                                } else {
                                    dragOpacity = (-1/value.translation.width) * 95
                                }
                            }
                        })
                        .onEnded({ value in
                            if dragOpacity < 0.55 {
                                next()
                                lastCardOpacity = 0
                                withAnimation(.linear(duration: 0.2).delay(0.4)) {
                                    lastCardOpacity = 1
                                }
                            } else {
                                withAnimation(.linear(duration: 0.2)) {
                                    dragOffset = .zero
                                    dragOpacity = 1
                                }
                            }
                            dragOpacity = 1
                            dragOffset = .zero
                        })
                )
            }
        }
    }
    
    public var body: some View {
        GeometryReader { reader in
            HStack(alignment: .center) {
                ZStack(alignment: .trailing) {
                    ForEach(0..<numberOfCards) { index in
                        card(at: index)
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: firstCardSize.height)
        }
    }
}
