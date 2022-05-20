//
//  PYVerticalGridView.swift
//  
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import SwiftUI

public struct PYVerticalGridView<Content: View>: View {
    private let gridItems: [GridItem]
    
    let content: Content
    let columns: Int
    let spacing: Double
    
    public init(columns: Int, spacing: Double = 10, @ViewBuilder _ content:  () -> Content) {
        self.content = content()
        self.columns = columns
        self.spacing = spacing
        self.gridItems = [GridItem](repeating: GridItem(spacing: spacing), count: columns)
    }
    
    public var body: some View {
        LazyVGrid(columns: gridItems, spacing: spacing) {
            content
        }
    }
}
