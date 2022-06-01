//
//  PuraceTabItem.swift
//  
//
//  Created by Juan Hurtado on 1/06/22.
//

import Foundation
import SwiftUI

struct PuraceTabItem<T: View> {
    let title: String
    let content: () -> T
}
