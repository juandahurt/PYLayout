//
//  AdjustableHStackExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 19/08/22.
//

import Foundation
import SwiftUI
import Purace

struct AdjustableHStackExample: View {
    var body: some View {
        ScrollView {
            PuraceAdjustableHStack { index in
                if index == 0 {
                    return ("Iglesias", URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_san_agustin_colombia_travel.jpg"))
                }
                if index == 1 {
                    return ("Museos", URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/71/Casa_en_donde_vivi%C3%B3_y_muri%C3%B3_el_Maestro_Guillermo_Le%C3%B3n_Valencia.jpg"))
                }
                if index == 2 {
                    return ("Emblemáticos", URL(string: "https://c8.alamy.com/zoomses/9/6c76df2a20324b87b4bda7eefe0012f9/dfy7wh.jpg"))
                }
                return ("Gubernamentales", URL(string: "https://live.staticflickr.com/3678/9998758505_11f317ab55_b.jpg"))
            }
                .frame(height: 250)
                .padding()
        }
    }
}
