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
    let url: URL?
    
    public init(url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        KFImage.url(url)
            .resizable()
            .fade(duration: 0.2)
            .placeholder { _ in
                GeometryReader { reader in
                    ZStack {
                        PuraceCircularLoaderView()
                            .foregroundColor(PuraceStyle.Color.G3)
                            .frame(width: reader.size.width * 0.1, height: reader.size.width * 0.1)
                            .position(x: reader.size.width / 2, y: reader.size.height / 2)
                    }
                }
            }
    }
}
