//
//  PuraceImageViewer.swift
//  
//
//  Created by Juan Hurtado on 25/06/22.
//

import Foundation
import SwiftUI

public struct PuraceImageViewer: View {
    var isVisible: Binding<Bool>
    let backgroundColor: Color
    let url: URL?
    @State var opacity: Double = 0
    
    public init(url: URL?, isVisible: Binding<Bool>) {
        let colors: [Color] = [
            PuraceStyle.Color.X1,
            PuraceStyle.Color.X2,
            PuraceStyle.Color.X3,
            PuraceStyle.Color.X4
        ]
        backgroundColor = colors.randomElement()!
        self.url = url
        self.isVisible = isVisible
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
            PuraceImageView(url: url)
                .scaledToFit()
                .frame(maxHeight: UIScreen.main.bounds.height * 0.75)
                .animation(.none)
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
        .onChange(of: isVisible.wrappedValue) { newValue in
            withAnimation {
                opacity = 1
            }
        }
        .opacity(opacity)
    }
}
