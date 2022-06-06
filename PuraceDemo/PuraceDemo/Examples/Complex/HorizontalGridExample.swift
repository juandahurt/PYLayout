//
//  HorizontalGridExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 5/06/22.
//

import Foundation
import SwiftUI
import Purace

struct HorizontalGridExample: View {
    var body: some View {
        PuraceHorizontalGridView {
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
            PuraceImageView(url: URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
        }.frame(height: UIScreen.main.bounds.height * 0.4)
        Spacer()
    }
}
