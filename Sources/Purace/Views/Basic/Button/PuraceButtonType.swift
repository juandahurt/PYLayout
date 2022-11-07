//
//  PuraceButtonType.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import Foundation
import SwiftUI

public enum PuraceButtonType {
    case loud, quiet, transparent
    case custom(Color, Color, Color) // 0: background, 1: on pressed, 2: text color
}
