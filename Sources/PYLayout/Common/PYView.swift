//
//  PYView.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import Foundation
import SwiftUI

protocol PYView {
    init(_ params: [String : Any])
}

public enum PYViewType {
    case text
}
