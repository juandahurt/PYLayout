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
    
    public init(urls: [URL?], isVisible: Binding<Bool>) {
        self.urls = urls
        self._isVisible = isVisible
    }
    
    public func body(content: Content) -> some View {
        if isVisible {
            ZStack {
                content
                PuraceImageViewer(urls: urls, isVisible: $isVisible)
            }
        } else {
            content
        }
    }
}

public extension View {
    func imageViewer(urls: [URL?], isVisible: Binding<Bool>) -> some View {
        modifier(PuraceImageViewerModifier(urls: urls, isVisible: isVisible))
    }
}
