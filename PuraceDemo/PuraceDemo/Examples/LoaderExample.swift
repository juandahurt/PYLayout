//
//  LoaderExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI
import Purace

struct LoaderExample: View {
    var body: some View {
        PuraceLoader(lineWidth: 3)
            .frame(width: 80, height: 80)
            .foregroundColor(PuraceStyle.Color.B2)
    }
}
