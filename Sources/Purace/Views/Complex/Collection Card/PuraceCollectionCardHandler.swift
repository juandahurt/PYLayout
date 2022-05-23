//
//  PuraceCollectionCardHandler.swift
//  
//
//  Created by Juan Hurtado on 18/05/22.
//

import Foundation

/// Defines the `PuraceCollectionCardView` interaction logic
public protocol PuraceCollectionCardHandler {
    /// It gets called when a user taps on a certain card.
    func didSelectCard(_ card: PuraceCollectionCardData)
}
