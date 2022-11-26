//
//  PuraceSnackbarConfig.swift
//  
//
//  Created by Juan Hurtado on 21/11/22.
//

import Foundation

struct PuraceSnackbarConfig {
    let title: String
    let type: PuraceSnackbarType = .info
    let action: (() -> Void)?
    let actionTitle: String?
}
