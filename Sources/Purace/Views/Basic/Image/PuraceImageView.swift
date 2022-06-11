//
//  PuraceImageView.swift
//  
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI
import Kingfisher
import ViewExtractor

public struct PuraceImageView: View {
    let skeletonColor: Color
    let url: URL?
    let overlayViews: [AnyView]
    
    @State var hasLoaded = false
    
    public init(url: URL?) {
        skeletonColor = PuraceStyle.Color.allSkeletons.randomElement()!
        self.url = url
        overlayViews = []
    }
    
    public init<Content: View>(url: URL?, @ViewBuilder content: NormalContent<Content>) {
        skeletonColor = PuraceStyle.Color.allSkeletons.randomElement()!
        self.url = url
        overlayViews = ViewExtractor.getViews(from: content)
    }
    
    public var body: some View {
        ZStack {
            KFImage.url(url)
                .resizable()
                .fade(duration: 0.2)
                .appendProcessor(DownsamplingImageProcessor(size: UIScreen.main.bounds.size))
                .scaleFactor(UIScreen.main.scale)
                .placeholder { _ in
                    skeletonColor
                }
                .onSuccess { _ in
                    hasLoaded = true
                }
            Group {
                ForEach(overlayViews.indices) { index in
                    overlayViews[index]
                }
            }.opacity(hasLoaded ? 1: 0)
        }
    }
}
