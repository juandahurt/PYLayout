//
//  PuraceSnackbarDisplayableContent.swift
//  
//
//  Created by Juan Hurtado on 14/12/22.
//

import Foundation

public class PuraceSnackbarDisplayableContent {
    private let content: PuraceSnackbarContent
    
    init(content: PuraceSnackbarContent) {
        self.content = content
    }
    
    public func show() {
        PuraceSnackbarManager.instance.show(using: content)
    }
}
