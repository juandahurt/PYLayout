//
//  PuraceSnackbarContent.swift
//  
//
//  Created by Juan Hurtado on 21/11/22.
//

import Foundation

public struct PuraceSnackbarContent {
    var title: String = ""
    var type: PuraceSnackbarType = .info
    var action: (() -> Void)?
    var actionTitle: String?
}
