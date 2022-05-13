//
//  PYViewFactory.swift
//  
//
//  Created by Juan Hurtado on 13/05/22.
//

import Foundation

protocol PYViewFactory {
    /// Builds a view.
    /// - Returns: The view
    func buildView(withLayout layout: PYViewType, params: [String : Any]) -> PYView
}
