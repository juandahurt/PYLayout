//
//  SnackbarExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import SwiftUI
import Purace

struct SnackBarExample: View {
    var body: some View {
        VStack {
            Text("`PuraceSnackbarView(title: ...)`")
                .padding()
            PuraceButtonView("Mostrar snackbar", fontSize: 14) {
                PuraceSnackbarManager.instance.show(withTitle: "Test", type: .info)
            }
            Spacer()
        }
    }
}
