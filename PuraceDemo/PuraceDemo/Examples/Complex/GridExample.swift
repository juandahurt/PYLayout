//
//  GridExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 19/05/22.
//

import Kingfisher
import Foundation
import SwiftUI
import Purace

struct GridExample: View {
    var body: some View {
        Text("`PuraceVerticalGridView(...)`")
            .padding()
        PuraceVerticalGridView(columns: 2, spacing: 1) {
            KFImage(URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                .resizable()
                .frame(height: 200)
            KFImage(URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                .resizable()
                .frame(height: 200)
            KFImage(URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                .resizable()
                .frame(height: 200)
            KFImage(URL(string: "https://www.biografiasyvidas.com/biografia/c/fotos/caldas_francisco_jose_2.jpg"))
                .resizable()
                .frame(height: 200)
        }
        Spacer()
    }
}
