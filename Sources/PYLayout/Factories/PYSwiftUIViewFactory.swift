//
//  PYSwiftUIViewFactory.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import Foundation
import SwiftUI

/// Payan view factory.
public final class PYSwiftUIViewFactory {
    public init() {}
    
    public func buildView(withLayout layout: PYViewType, params: [String : Any]) -> some View {
        switch layout {
        case .text:
            return PYTextView(params)
        }
    }
}
