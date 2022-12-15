//
//  PuraceSnackbarBuilder.swift
//  
//
//  Created by Juan Hurtado on 14/12/22.
//

import Foundation

/// Snackbar builder.
///
/// If you want to build and show a snackbar:
/// ```
/// let builder = PuraceSnackbarBuilder()
///
/// builder
///     .withTitle("This is a snackbar!")
///     .build()
///     .show()
/// ```
public class PuraceSnackbarBuilder {
    private var content: PuraceSnackbarContent
    
    public init() {
        content = PuraceSnackbarContent()
    }
    
    public func withTitle(_ title: String) -> PuraceSnackbarBuilder {
        content.title = title
        return self
    }
    
    public func withType(_ type: PuraceSnackbarType) -> PuraceSnackbarBuilder {
        content.type = type
        return self
    }
    
    public func withAction(title: String?, handler: @escaping () -> Void) -> PuraceSnackbarBuilder {
        content.actionTitle = title
        content.action = handler
        return self
    }
    
    public func build() -> PuraceSnackbarDisplayableContent {
        PuraceSnackbarDisplayableContent(content: content)
    }
}
