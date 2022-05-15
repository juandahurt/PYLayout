//
//  MenuView.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 13/05/22.
//

import PYLayout
import SwiftUI
import UIKit

struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basic")) {
                    NavigationLink("Text") {
                        TextExample()
                    }
                    NavigationLink("Button") {
                        ButtonExample()
                    }
                }
                Section(header: Text("Complex")) {
                    NavigationLink("Collection card") {
                        CollectionCardExample()
                    }
                    NavigationLink("Story") {
                        StoryExample()
                    }
                }
            }
            .navigationTitle("Payan Layout")
        }
    }
}
