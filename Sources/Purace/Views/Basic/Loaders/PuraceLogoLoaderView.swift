//
//  PuraceLogoLoaderView.swift
//  
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI

public struct PuraceLogoLoaderView: View {
    @State var backgroundHeight: Double = 0
    @Binding var percentage: Double
    
    public init(percentage: Binding<Double>) {
        _percentage = percentage
    }
    
    private func updateBackgroundHeight(in size: CGSize) {
        backgroundHeight = size.height * percentage
    }
    
    public var body: some View {
        return GeometryReader { reader in
            ZStack(alignment: .center) {
                Image("logo", bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.5)
                VStack {
                    Spacer(minLength: 0)
                    Color.black
                        .frame(height: backgroundHeight)
                        .blendMode(.overlay)
                }
            }.onChange(of: percentage) { newValue in
                withAnimation {
                    updateBackgroundHeight(in: reader.size)
                }
            }
        }
    }
}
