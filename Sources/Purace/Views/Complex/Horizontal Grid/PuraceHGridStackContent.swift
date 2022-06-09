//
//  PuraceHGridStackContent.swift
//  
//
//  Created by Juan Hurtado on 6/06/22.
//

import Foundation
import SwiftUI

enum PuraceHGridStackContent: Identifiable {
    var id: String {
        UUID().uuidString
    }
    case subStack(axis: PuraceHGridStackAxis, children: [PuraceHGridStackContent])
    case leaf(content: [AnyView])
}

enum PuraceHGridStackAxis {
    case horizontal, vertical
}
