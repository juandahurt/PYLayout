//
//  ImageExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI
import Purace

struct ImageExample: View {
    var body: some View {
        Text("`PraceImageView(url: ...)`")
        PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            .frame(width: 150, height: 150)
        Spacer()
    }
}
