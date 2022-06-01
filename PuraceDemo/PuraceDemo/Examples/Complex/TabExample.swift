//
//  TabExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 1/06/22.
//

import Foundation
import SwiftUI
import Purace

struct TabExample: View {
    var body: some View {
        PuraceTabView { index in
            Group {
                switch index {
                case 0:
                    PuraceTextView("First view")
                case 1:
                    PuraceTextView("Second view")
                default:
                    PuraceTextView("Third view")
                }
            }.frame(height: 100)
        }
        Spacer()
    }
}
