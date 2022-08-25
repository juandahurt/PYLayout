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
    @State var showSnackbar = false
    
    var body: some View {
        VStack {
            Text("`PuraceSnackbarView(title: ...)`")
                .padding()
            PuraceButtonView(!showSnackbar ? "Mostrar snackbar" : "Ocultar snackbar", fontSize: 14) {
                showSnackbar = !showSnackbar
            }
            Spacer()
        }.snackBar(title: "Parece que ha ocurrido un error", isVisible: $showSnackbar, type: .info, buttonTitle: "REINTENTAR", duration: .long, dismissOnDrag: true)
    }
}
