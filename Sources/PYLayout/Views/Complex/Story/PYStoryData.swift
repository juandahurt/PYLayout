//
//  PYStoryData.swift
//  
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation

public protocol PYStoryData {
    var image: URL? { get }
    var title: String { get }
    var subtitle: String { get }
}
