//
//  ButtonExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import SwiftUI
import Purace

struct ButtonExample: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("`PuraceButtonView('title', type: .loud)`")
                PuraceButtonView("small", size: .small)
                PuraceButtonView("medium")
                PuraceButtonView("large", size: .large)
                    .padding(.bottom)
            }
            
            VStack {
                Text("`PuraceButtonView('title', type: .quiet)`")
                PuraceButtonView("small", size: .small, type: .quiet)
                PuraceButtonView("medium", type: .quiet)
                PuraceButtonView("large", size: .large, type: .quiet)
                    .padding(.bottom)
            }
//
//            VStack {
//                Text("`PuraceButtonView('title', type: .transparent)`")
//                PuraceButtonView("Font size: 12", fontSize: 12, type: .transparent)
//                PuraceButtonView("Font size: 14", fontSize: 14, type: .transparent)
//                PuraceButtonView("Font size: 16", fontSize: 16, type: .transparent)
//                Spacer()
//            }
        }
    }
}
