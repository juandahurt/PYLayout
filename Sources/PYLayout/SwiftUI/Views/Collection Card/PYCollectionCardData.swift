//
//  PYCollectionCardData.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation

/// Defines the data that a collection card can show.
public protocol PYCollectionCardData {
    /// Card's identifier
    var id: String { get }
    /// Card's backgrond image
    var backgroundImage: URL? { get }
    /// Card's title
    var title: String { get }
}
