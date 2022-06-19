//
//  PuraceModalView.swift
//  
//
//  Created by Juan Hurtado on 19/06/22.
//

import Foundation
import SwiftUI

public struct PuraceModalView: View {
    let titleText: String
    let contentText: String
    var isVisible: Binding<Bool>
    
    @State var opacity: Double = 0
    
    public init(title: String, content: String, isVisible: Binding<Bool>) {
        self.titleText = title
        self.contentText = content
        self.isVisible = isVisible
    }
    
    var title: some View {
        HStack {
            PuraceTextView(titleText, fontSize: 14, weight: .medium)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
    }
    
    var content: some View {
        HStack {
            PuraceTextView(contentText)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
    }
    
    var card: some View {
        VStack(spacing: 5) {
            title
            content
        }
        .padding()
        .background(Color.white)
        .opacity(opacity)
        .cornerRadius(5)
    }
    
    public var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
            VStack(spacing: 15) {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .onTapGesture {
                            isVisible.wrappedValue = false
                        }
                }
                card
            }.padding(.horizontal)
        }
        .onChange(of: isVisible.wrappedValue) { visible in
            withAnimation {
                opacity = visible ? 1 : 0
            }
        }
        .opacity(opacity)
    }
}
