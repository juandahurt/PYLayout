//
//  PYTextView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import SwiftUI

struct PYTextView: View, PYView {
    let text: String
    let fontSize: Int
    
    init(_ params: [String : Any]) {
        text = params["text"] as? String ?? ""
        fontSize = params["fontSize"] as? Int ?? 12
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: CGFloat(fontSize)))
    }
}
