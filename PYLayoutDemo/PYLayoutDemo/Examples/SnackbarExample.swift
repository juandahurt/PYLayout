//
//  SnackbarExample.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 19/05/22.
//

import Foundation
import SwiftUI
import PYLayout

struct SnackBarExample: View {
    @State var showSnackbar = false
    
    var body: some View {
        Text("`PYSnackbarView(title: ...)`")
            .padding()
        PYButtonView(!showSnackbar ? "Mostrar snackbar" : "Ocultar snackbar", fontSize: 14) {
            showSnackbar = !showSnackbar
        }
        Spacer()
        PYSnackbarView(
            title: "Hay una actualización disponible",
            isVisible: $showSnackbar,
            buttonTitle: "ACTUALIZAR"
        )
    }
}
