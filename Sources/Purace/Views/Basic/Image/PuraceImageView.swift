//
//  PuraceImageView.swift
//  
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI
import Kingfisher

public struct PuraceImageView: View {
    let skeletonColor: Color
    let url: URL?
    
    public init(url: URL?) {
        self.skeletonColor = PuraceStyle.Color.allSkeletons.randomElement()!
        self.url = url
    }
    
    public var body: some View {
        KFImage.url(url)
            .resizable()
            .appendProcessor(DownsamplingImageProcessor(size: UIScreen.main.bounds.size))
            .scaleFactor(UIScreen.main.scale)
            .placeholder { _ in
                skeletonColor
            }
    }
}
