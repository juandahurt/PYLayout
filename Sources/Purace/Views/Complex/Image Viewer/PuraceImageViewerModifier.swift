//
//  PuraceImageViewerModifier.swift
//  
//
//  Created by Juan Hurtado on 26/06/22.
//

import Foundation
import SwiftUI

public struct PuraceImageViewerModifier: ViewModifier {
    let urls: [URL?]
    @Binding var isVisible: Bool
    let selectedIndex: Int
    
    public init(urls: [URL?], isVisible: Binding<Bool>, selectedIndex: Int) {
        self.urls = urls
        self._isVisible = isVisible
        self.selectedIndex = selectedIndex
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isVisible {
                PuraceImageViewer(urls: urls, isVisible: $isVisible, index: selectedIndex)
            }
        }
    }
}

public extension View {
    func imageViewer(urls: [URL?], isVisible: Binding<Bool>, selectedIndex: Int = 0) -> some View {
        modifier(PuraceImageViewerModifier(urls: urls, isVisible: isVisible, selectedIndex: selectedIndex))
    }
}
