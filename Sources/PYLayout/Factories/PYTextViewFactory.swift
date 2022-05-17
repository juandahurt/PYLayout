//
//  PYTextViewFactory.swift
//  
//
//  Created by Juan Hurtado on 16/05/22.
//

import Foundation
import SwiftUI

public final class PYTextViewFactory {
    public static func buildView(params: [String: Any]?) -> some View {
        let text = params?["text"] as? String ?? ""
        let fontSize = params?["fontSize"] as? Int ?? 12
        var textColor: Color = .black
        if let hexColor = params?["textColor"] as? String {
            textColor = Color(hexColor) ?? .black
        }
        var weight: PYTextWeight = .regular
        if let weightString = params?["weight"] as? String {
            weight = PYTextWeight(rawValue: weightString) ?? .regular
        }
        return PYTextView(text, fontSize: fontSize, textColor: textColor, weight: weight)
    }
}
