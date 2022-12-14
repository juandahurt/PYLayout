//
//  SearchExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 11/12/22.
//

import SwiftUI
import Purace

struct SearchExample: View {
    @State var text = ""
    
    var body: some View {
        PuraceSearchBox("Buscar...", text: $text)
            .padding(16)
        Spacer()
    }
}
