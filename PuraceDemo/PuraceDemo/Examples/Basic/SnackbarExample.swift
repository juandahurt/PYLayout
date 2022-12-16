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
    @State var showActionButton = false
    private let types = ["info", "error", "alert"]
    @State var selectedType = "info"
    
    func getType() -> PuraceSnackbarType {
        switch selectedType {
        case "info":
            return .info
        case "error":
            return .error
        case "alert":
            return .alert
        default: return .error
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $showActionButton) {
                    PuraceTextView("Mostrar el botón de acción")
                }
            }
            
            HStack {
                PuraceTextView("Tipo")
                Picker("", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Spacer()
            }
            
            PuraceButtonView("Mostrar snackbar") {
                PuraceSnackbarBuilder()
                    .withTitle("Hubo un error")
                    .withType(getType())
                    .withAction(title: showActionButton ? "REINTENTAR" : nil, handler: {
                        print("Action button tapped")
                    })
                    .build()
                    .show()
            }
            Spacer()
        }.padding(.horizontal)
    }
}
