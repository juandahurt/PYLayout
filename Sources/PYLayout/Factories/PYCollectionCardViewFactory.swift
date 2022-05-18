//
//  PYCollectionCardViewFactory.swift
//  
//
//  Created by Juan Hurtado on 17/05/22.
//

import Foundation
import SwiftUI

class PYCollectionCardViewFactory {
    static func buildView(params: [String: Any]?) -> some View {
        var cards: [CollectionCardData] = []
        if let cardRawArray = params?["elements"] as? [[String: Any]] {
            for rawCard in cardRawArray {
                let title = rawCard["title"] as? String ?? ""
                let imageUrl = rawCard["imageUrl"] as? String ?? ""
                cards.append(CollectionCardData(title: title, imageUrl: imageUrl))
            }
        }
        return PYCollectionCardView(cards: cards)
    }
}

struct CollectionCardData: PYCollectionCardData {
    var id: String = "12"
    var backgroundImage: URL?
    var title: String
    
    init(title: String, imageUrl: String) {
        self.title = title
        self.backgroundImage = URL(string: imageUrl)
    }
}
