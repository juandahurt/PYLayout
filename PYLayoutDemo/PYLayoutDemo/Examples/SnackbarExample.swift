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
        PYButtonView(!showSnackbar ? "Mostrar snackbar" : "Ocultar snackbar", fontSize: 14)
            .simultaneousGesture(
                TapGesture(count: 1)
                    .onEnded {
                        showSnackbar = !showSnackbar
                    }
            )
        Spacer()
        PYSnackbarView(
            title: "Hay una actualización disponible",
            isVisible: $showSnackbar
        )
    }
}
