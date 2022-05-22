//
//  PYCollectionCardHandler.swift
//  
//
//  Created by Juan Hurtado on 18/05/22.
//

import Foundation

/// Defines the `PYCollectionCardView` interaction logic
public protocol PYCollectionCardHandler {
    /// It gets called when a user taps on a certain card.
    func didSelectCard(_ card: PYCollectionCardData)
}
