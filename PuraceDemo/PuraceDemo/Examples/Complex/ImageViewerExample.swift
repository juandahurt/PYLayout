//
//  ImageViewerExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 25/06/22.
//

import Foundation
import SwiftUI
import Purace

struct ImageViewerExample: View {
    @State var isVisible = false
    
    var body: some View {
        ZStack {
            VStack {
                PuraceButtonView("Mostrar imagen") {
                    isVisible.toggle()
                }
                Spacer()
            }
            PuraceImageViewer(
                url: URL(string: "https://payan-dev-images.s3.us-east-2.amazonaws.com/santo-domingo.jpg"),
                isVisible: $isVisible
            )
        }
    }
}
