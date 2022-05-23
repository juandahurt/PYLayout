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
        Text("`PuraceButtonView('title', type: .loud)`")
        PuraceButtonView("Font size: 12", fontSize: 12)
        PuraceButtonView("Font size: 14", fontSize: 14)
        PuraceButtonView("Font size: 16", fontSize: 16)
            .padding(.bottom)
        
        Text("`PuraceButtonView('title', type: .quiet)`")
        PuraceButtonView("Font size: 12", fontSize: 12, type: .quiet)
        PuraceButtonView("Font size: 14", fontSize: 14, type: .quiet)
        PuraceButtonView("Font size: 16", fontSize: 16, type: .quiet)
        Spacer()
    }
}
