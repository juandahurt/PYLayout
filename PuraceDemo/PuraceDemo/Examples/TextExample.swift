//
//  TextExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import SwiftUI
import Purace

struct TextExample: View {
    var body: some View {
        Text("`PuraceTextView('text')`")
            .padding()
        PuraceTextView("Size: 12", fontSize: 12)
        PuraceTextView("Size: 14", fontSize: 14)
        PuraceTextView("Size: 16", fontSize: 16)
        PuraceTextView("Size: 18", fontSize: 18)
        PuraceTextView("Size: 20", fontSize: 20)
        Text("*note: the color is static*")
            .padding()
        Spacer()
    }
}
