//
//  PuraceStyle.swift
//  
//
//  Created by Juan Hurtado on 22/05/22.
//

import Foundation
import SwiftUI

/// Contains Purace styles.
public struct PuraceStyle {
    /// Purace Colors
    public struct Color {
        public static let N1 = SwiftUI.Color(hex: "2B2B2B") ?? .black
        public static let N2 = SwiftUI.Color(hex: "434343") ?? .black
        public static let N3 = SwiftUI.Color(hex: "636363") ?? .black
        public static let N4 = SwiftUI.Color(hex: "808080") ?? .black
        public static let N5 = SwiftUI.Color(hex: "8D8D8D") ?? .black
        public static let N8 = SwiftUI.Color(hex: "EEEEEE") ?? .black
        
        public static let B1 = SwiftUI.Color(hex: "4E82DD") ?? .blue
        public static let B2 = SwiftUI.Color(hex: "6491DF") ?? .blue
        public static let B4 = SwiftUI.Color(hex: "A7C3F6") ?? .blue
        public static let B5 = SwiftUI.Color(hex: "E8F0FF") ?? .blue
        
        public static let G1 = SwiftUI.Color(hex: "414952") ?? .gray
        public static let G2 = SwiftUI.Color(hex: "59636D") ?? .gray
        public static let G3 = SwiftUI.Color(hex: "6B7783") ?? .gray
        public static let G4 = SwiftUI.Color(hex: "808E9C") ?? .gray
        public static let G5 = SwiftUI.Color(hex: "A6B3BF") ?? .gray
        public static let G6 = SwiftUI.Color(hex: "C4CCD3") ?? .gray
        public static let G7 = SwiftUI.Color(hex: "D7DCE1") ?? .gray
        public static let G8 = SwiftUI.Color(hex: "DFE4E8") ?? .gray
        
        public static let S1 = SwiftUI.Color(hex: "CECEC9") ?? .orange
        public static let S2 = SwiftUI.Color(hex: "CFCCC8") ?? .orange
        public static let S3 = SwiftUI.Color(hex: "E5DBCB") ?? .orange
        public static let S4 = SwiftUI.Color(hex: "DACAB5") ?? .orange
        public static let S5 = SwiftUI.Color(hex: "F1F2F4") ?? .orange
        public static let S6 = SwiftUI.Color(hex: "D0CEC6") ?? .orange
        public static let S7 = SwiftUI.Color(hex: "D4CAC6") ?? .orange
        public static let S8 = SwiftUI.Color(hex: "C8D0CA") ?? .orange
        
        public static let X1 = SwiftUI.Color(hex: "272627") ?? .gray
        public static let X2 = SwiftUI.Color(hex: "3F402D") ?? .gray
        public static let X3 = SwiftUI.Color(hex: "3B140E") ?? .gray
        public static let X4 = SwiftUI.Color(hex: "17293E") ?? .gray
        
        public static let allSkeletons: [SwiftUI.Color] = [Color.S1, Color.S2, Color.S3, Color.S4, Color.S5, Color.S6, Color.S7, Color.S8]
    }
    
    public struct Font {
        public static func get(size: CGFloat, weight: PuraceTextWeight = .regular) -> SwiftUI.Font {
            var fontName = "Poppins-"
            switch weight {
            case .regular:
                fontName += "Regular"
            case .medium:
                fontName += "Medium"
            case .semibold:
                fontName += "SemiBold"
            }
            return .custom(fontName, size: size)
        }
    }
}
