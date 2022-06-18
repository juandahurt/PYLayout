//
//  CollectionCardExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import Purace
import SwiftUI

struct CollectionCardExample: View {
    var body: some View {
        ScrollView {
            Text("`PuraceCollectionCardView(cards: ...)`")
                .padding()
            PuraceCollectionCardView(
                firstCardSize: .init(width: UIScreen.main.bounds.height * 0.35, height: UIScreen.main.bounds.width * 0.9),
                cards: [
                    MockCard("https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"),
                    MockCard("https://upload.wikimedia.org/wikipedia/commons/a/ac/Froil%C3%A1n_Largacha_Hurtado.jpg"),
                    MockCard("https://upload.wikimedia.org/wikipedia/commons/8/86/Camilo_Torres_y_Tenorio.jpg")
                ]
            ) { card in
                print("selected card: \(card)")
            }
            Spacer()
        }
    }
}

struct MockCard: PuraceCollectionCardData {
    var deepLink: String = ""
    var backgroundImage: URL?
    var title: String = "Froilán Largacha Hurtado"
    var subtitle: String = "From the Palacsdfdfsfdsfdffsfsfsddf sfs f e of Versailles to the Florida Kahlo museum"
    
    init(_ url: String) {
        self.backgroundImage = URL(string: url)
    }
}
