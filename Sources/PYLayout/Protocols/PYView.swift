//
//  PYView.swift
//  
//
//  Created by Juan Hurtado on 16/05/22.
//

import Foundation

/// Defines a Payan view
protocol PYView {
    /// Used by the view factory to know which view must be build.
    static var identifier: String { get }
}
