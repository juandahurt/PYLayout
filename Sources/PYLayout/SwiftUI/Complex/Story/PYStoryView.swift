//
//  PYStoryView.swift
//  
//
//  Created by Juan Hurtado on 15/05/22.
//

import SwiftUI
import Kingfisher

public struct PYStoryView: View {
    public init() {}
    
    var indicators: some View {
        HStack(spacing: 3) {
            Color.white.opacity(0.8)
                .cornerRadius(1)
            Color.white.opacity(0.3)
                .cornerRadius(1)
            Color.white.opacity(0.3)
                .cornerRadius(1)
            Color.white.opacity(0.3)
                .cornerRadius(1)
        }.frame(height: 5)
    }
    
    public var body: some View {
        ZStack {
            KFImage.url(URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_santo_domingo_colombia_travel.jpg")!)
                .resizable()
            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.35)]), startPoint: .top, endPoint: .center)
            VStack {
                Spacer()
                HStack {
                    PYTextView("Title", fontSize: 16, textColor: .white, weight: .medium)
                    Spacer()
                }
                HStack {
                    PYTextView("Subtitle", fontSize: 12, textColor: .white)
                    Spacer()
                }
            }.padding()
            GeometryReader { geometry in
                HStack {
                    Color.blue
                        .opacity(0)
                        .frame(width: geometry.size.width * 0.3)
                    Spacer()
                    Color.blue
                        .opacity(0)
                        .frame(width: geometry.size.width * 0.3)
                }
                
            }
            VStack {
                indicators
                Spacer()
            }
                .padding(5)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.33)
        
    }
}
