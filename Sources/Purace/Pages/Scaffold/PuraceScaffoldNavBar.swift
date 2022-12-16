//
//  PuraceScaffoldNavBar.swift
//  
//
//  Created by Juan Hurtado on 7/08/22.
//

import Foundation
import SwiftUI

public struct PuraceScaffoldNavBar: View {
    var title: String
    var backOnTap: () -> Void
    
    public init(title: String, backOnTap: @escaping () -> Void) {
        self.title = title
        self.backOnTap = backOnTap
    }
    
    public var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                Spacer(minLength: 0)
                HStack(alignment: .center) {
                    Button {
                        backOnTap()
                    } label: {
                        Image("arrow_left", bundle: .module)
                            .foregroundColor(PuraceStyle.Color.N1)
                    }.frame(width: 20)
                        .buttonStyle(.plain)
                    
                    Spacer(minLength: 0)
                    
                    PuraceTextView(title, fontSize: 14, weight: .medium)
                        .multilineTextAlignment(.center)
                    
                    Spacer(minLength: 0)
                    
                    Color.white
                        .frame(width: 20, height: 20)
                        .background(Color.white)
                }
                Spacer(minLength: 0)
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
}
