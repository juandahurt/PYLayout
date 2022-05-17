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
            PYViewFactory.buildView(
                ofLayout: "btn",
                params: [
                    "title": "Ver todos",
                    "fontSize": 14,
                    "deepLink": "payan://collection?typeId=123",
                    "handler": self,
                    "type": "quiet"
                ]
            )
            Spacer()
        }
    }
}

extension FactoryExample: PYButtonHandler {
    func onTap(deepLink: String?) {
        print(deepLink ?? "Tap on button without deep link")
    }
}
