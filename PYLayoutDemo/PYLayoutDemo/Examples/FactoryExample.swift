//
//  FactoryExample.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 16/05/22.
//

import Foundation
import PYLayout
import SwiftUI

struct FactoryExample: View {
    var body: some View {
        ScrollView {
            PYViewFactory.buildView(
                ofLayout: "txt",
                params: [
                    "text": "Próceres",
                    "fontSize": 22,
                ]
            )
            PYViewFactory.buildView(
                ofLayout: "txt",
                params: [
                    "text": "Algunos de los personajes ilustres de Popayán",
                    "fontSize": 14,
                    "textColor": "#636363"
                ]
            )
            Spacer()
        }
    }
}
