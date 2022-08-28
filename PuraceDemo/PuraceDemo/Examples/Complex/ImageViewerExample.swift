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
    
    let urls: [URL?] = [
        URL(string: "https://payan-dev-images.s3.us-east-2.amazonaws.com/santo-domingo.jpg"),
        URL(string: "https://payan-dev-images.s3.us-east-2.amazonaws.com/santo-domingo.jpg"),
        URL(string: "https://payan-places.s3.us-east-2.amazonaws.com/001/001.jpg")
    ]
    
    var body: some View {
        VStack {
            PuraceButtonView("Mostrar imagen") {
                isVisible.toggle()
            }
            Spacer()
        }.imageViewer(
            urls: urls,
            isVisible: $isVisible,
            selectedIndex: 1
        )
            .navigationBarHidden(true)
    }
}
