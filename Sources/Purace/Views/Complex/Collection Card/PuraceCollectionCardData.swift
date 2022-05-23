//
//  PuraceCollectionCardData.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation

/// Defines the data that a collection card can show.
public protocol PuraceCollectionCardData {
    /// Card's deep link
    var deepLink: String { get }
    /// Card's backgrond image
    var backgroundImage: URL? { get }
    /// Card's title
    var title: String { get }
}
