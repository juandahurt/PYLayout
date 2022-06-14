//
//  AccordionExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 13/06/22.
//

import Foundation
import SwiftUI
import Purace

struct AccordionExample: View {
    var body: some View {
        VStack {
            PuraceAccordionView(title: "Biografía") {
                PuraceTextView("Fue un político, militar y estadista colombiano, miembro del Partido Liberal Colombiano. A lo largo de su carrera ocupó varios cargos importantes en varios gobiernos, y también destacó como militar laureado, participando en algunas guerras civiles colombianas, como la de 1854, 1875 y 1885.")
                    .multilineTextAlignment(.leading)
                    .padding(10)
            }
            Spacer()
        }
    }
}
