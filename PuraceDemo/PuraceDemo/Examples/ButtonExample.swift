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
        Text("`PYButtonView('title', type: .loud)`")
        PYButtonView("Font size: 12", fontSize: 12)
        PYButtonView("Font size: 14", fontSize: 14)
        PYButtonView("Font size: 16", fontSize: 16)
            .padding(.bottom)
        
        Text("`PYButtonView('title', type: .quiet)`")
        PYButtonView("Font size: 12", fontSize: 12, type: .quiet)
        PYButtonView("Font size: 14", fontSize: 14, type: .quiet)
        PYButtonView("Font size: 16", fontSize: 16, type: .quiet)
        Spacer()
    }
}
