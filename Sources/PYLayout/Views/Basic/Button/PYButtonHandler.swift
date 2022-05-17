//
//  PYButtonHandler.swift
//  
//
//  Created by Juan Hurtado on 17/05/22.
//

import Foundation

public protocol PYButtonHandler {
    /// It gets called when a user taps on a button.
    func onTap(deepLink: String?)
}
