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
            PYTextView("Explora lugares", fontSize: 24)
                .padding(.bottom, 5)
            PYTextView("Adentrate en el corazón de la ciudad blanca", fontSize: 12)
        }
    }
}
