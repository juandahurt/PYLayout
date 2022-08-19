//
//  AdjustableHStackExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 19/08/22.
//

import Foundation
import SwiftUI
import Purace

struct AdjustableHStackExample: View {
    var body: some View {
        ScrollView {
            PuraceAdjustableHStack()
                .frame(height: 250)
                .padding()
        }
    }
}
