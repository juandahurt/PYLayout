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
    let urls = [
        URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_santo_domingo_colombia_travel.jpg"),
        URL(string: "https://live.staticflickr.com/3678/9998758505_11f317ab55_b.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/71/Casa_en_donde_vivi%C3%B3_y_muri%C3%B3_el_Maestro_Guillermo_Le%C3%B3n_Valencia.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Iglesia_San_Francisco_2.JPG"),
        URL(string: "https://c8.alamy.com/zoomses/9/6c76df2a20324b87b4bda7eefe0012f9/dfy7wh.jpg"),
        URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/0f/La_Capilla_de_Belen.jpg"),
        URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_san_agustin_colombia_travel.jpg"),
    ]
    
    func image(url: URL?) -> some View {
        Color.clear
            .background(
                PuraceImageView(url: url)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            )
            .clipped()
    }
    
    var body: some View {
        PuraceHorizontalGridView {
            ForEach(urls.indices) { index in
                image(url: urls[index])
            }
        }.frame(height: UIScreen.main.bounds.height * 0.4)
        Spacer()
    }
}
