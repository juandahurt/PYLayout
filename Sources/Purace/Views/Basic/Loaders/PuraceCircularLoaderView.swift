//
//  PuraceCircularLoaderView.swift
//  
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI

public struct PuraceCircularLoaderView: View {
    let lineWidth: CGFloat
    @State var rotation: Double = 0
    
    public init(lineWidth: CGFloat = 2) {
        self.lineWidth = lineWidth
    }
    
    public var body: some View {
        let animation = Animation.default
            .repeatForever(autoreverses: false)
            .speed(.random(in: 0.4...0.5))
        
        GeometryReader { reader in
            Group { () -> Path in
                var path = Path()
                path.addArc(
                    center: CGPoint(x: reader.size.width / 2, y: reader.size.height / 2),
                    radius: reader.size.width / 2,
                    startAngle: .degrees(0),
                    endAngle: .degrees(.random(in: 250...300)),
                    clockwise: false
                )
                return path.strokedPath(.init(lineWidth: lineWidth, lineCap: .round))
            }.rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(animation) {
                        rotation = 360
                    }
                }
        }
    }
}
