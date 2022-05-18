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
            VStack(spacing: 0) {
                PYViewFactory.buildView(
                    ofLayout: "txt",
                    params: [
                        "text": "Próceres",
                        "fontSize": 22,
                        "margin": [
                            "bottom": 5.0
                        ]
                    ]
                )
                PYViewFactory.buildView(
                    ofLayout: "txt",
                    params: [
                        "text": "Algunos de los personajes ilustres de Popayán",
                        "fontSize": 14,
                        "textColor": "#636363",
                        "margin": [
                            "bottom": 20.0
                        ]
                    ]
                )
                PYViewFactory.buildView(
                    ofLayout: "cc",
                    params: [
                        "margin": [
                            "bottom": 20.0
                        ],
                        "elements": [
                            [
                                "title": "Francisco José de Caldas",
                                "imageUrl": "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"
                            ],
                            [
                                "title": "Froilán Largacha Hurtado",
                                "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/a/ac/Froil%C3%A1n_Largacha_Hurtado.jpg"
                            ],
                            [
                                "title": "Camilo Torres Tenorio",
                                "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/8/86/Camilo_Torres_y_Tenorio.jpg"
                            ],
                        ]
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
}

extension FactoryExample: PYButtonHandler {
    func onTap(deepLink: String?) {
        print(deepLink ?? "Tap on button without deep link")
    }
}
