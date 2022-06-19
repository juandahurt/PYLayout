//
//  ModalExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 19/06/22.
//

import Foundation
import SwiftUI
import Purace

struct ModalExample: View {
    @State var isVisible = false
    
    var body: some View {
        ZStack {
            VStack {
                PuraceButtonView("Mostrar") {
                    isVisible.toggle()
                }
                Spacer()
            }
            PuraceModalView(
                title: "Lorem ipsum",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                isVisible: $isVisible
            )
        }
    }
}
