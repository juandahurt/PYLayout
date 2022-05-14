//
//  ViewController.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 13/05/22.
//

import PYLayout
import SwiftUI
import UIKit
//https://thumbs.dreamstime.com/b/popaya-cauca-colombia-popayan-ciudad-colonial-de-declarada-patrimonio-mundial-por-la-unesco-iglesia-san-francio-192059497.jpg
struct FeedView: View {
    
    var body: some View {
        ScrollView {
            PYCollectionCardView()
//            PYTextView("Explora lugares", fontSize: 24)
//                .padding(.bottom, 5)
//            PYTextView("Adentrate en el corazón de la ciudad blanca", fontSize: 12)
        }
    }
}
