//
//  CollectionCardExample.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import PYLayout
import SwiftUI

struct CollectionCardExample: View {
    var body: some View {
        Text("`PYCollectionCardView(cards: ...)`")
            .padding()
        PYCollectionCardView(cards: [
            MockCard("https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"),
            MockCard("https://upload.wikimedia.org/wikipedia/commons/a/ac/Froil%C3%A1n_Largacha_Hurtado.jpg"),
            MockCard("https://upload.wikimedia.org/wikipedia/commons/8/86/Camilo_Torres_y_Tenorio.jpg")
        ])
        Spacer()
    }
}

struct MockCard: PYCollectionCardData {
    var id: String = ""
    var backgroundImage: URL?
    var title: String = "Froilán Largacha Hurtado"
    
    init(_ url: String) {
        self.backgroundImage = URL(string: url)
    }
}
