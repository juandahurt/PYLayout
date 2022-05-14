//
//  ViewController.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 13/05/22.
//

import PYLayout
import SwiftUI
import UIKit

struct FeedView: View {
    
    var body: some View {
        ScrollView {
            PYTextView("Próceres", fontSize: 24)
            PYTextView("Personajes ilustres de la ciudad blanca", fontSize: 12)
                .padding(.bottom)
            PYCollectionCardView(cards: [
                MockCard("https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"),
                MockCard("https://upload.wikimedia.org/wikipedia/commons/a/ac/Froil%C3%A1n_Largacha_Hurtado.jpg"),
                MockCard("https://upload.wikimedia.org/wikipedia/commons/8/86/Camilo_Torres_y_Tenorio.jpg")
            ])
        }
    }
}

struct MockCard: PYCollectionCardData {
    var id: String = ""
    var backgroundImage: URL?
    var title: String = ""
    
    init(_ url: String) {
        self.backgroundImage = URL(string: url)
    }
}
