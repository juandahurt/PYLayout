//
//  TextExample.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import SwiftUI
import Purace

struct TextExample: View {
    var body: some View {
        Text("`PYTextView('text')`")
            .padding()
        PYTextView("Size: 12", fontSize: 12)
        PYTextView("Size: 14", fontSize: 14)
        PYTextView("Size: 16", fontSize: 16)
        PYTextView("Size: 18", fontSize: 18)
        PYTextView("Size: 20", fontSize: 20)
        Text("*note: the color is static*")
            .padding()
        Spacer()
    }
}
