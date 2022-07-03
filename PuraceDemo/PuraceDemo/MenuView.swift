//
//  MenuView.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 13/05/22.
//

import Purace
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
                    NavigationLink("Snackbar") {
                        SnackBarExample()
                    }
                    NavigationLink("Loader") {
                        LoaderExample()
                    }
                    NavigationLink("Image") {
                        ImageExample()
                    }
                    NavigationLink("Accordion") {
                        AccordionExample()
                    }
                    NavigationLink("Modal") {
                        ModalExample()
                    }
                    NavigationLink("Text Field") {
                        TextFieldExample()
                    }
                }
                Section(header: Text("Complex")) {
                    NavigationLink("Collection card") {
                        CollectionCardExample()
                    }
                    NavigationLink("Story") {
                        StoryExample()
                    }
                    NavigationLink("Grid") {
                        GridExample()
                    }
                    NavigationLink("Horizontal Grid") {
                        HorizontalGridExample()
                    }
                    NavigationLink("Tab") {
                        TabExample()
                    }
                    NavigationLink("Image Viewer") {
                        ImageViewerExample()
                    }
                }
            }
            .navigationTitle("Purace")
        }
    }
}
