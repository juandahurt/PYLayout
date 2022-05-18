//
//  PYViewFactory.swift
//  
//
//  Created by Juan Hurtado on 16/05/22.
//

import Foundation
import SwiftUI

public final class PYViewFactory {
    public static func buildView(ofLayout layout: String, params: [String: Any]?) -> some View {
        return Group {
            switch layout {
            case PYTextView.identifier:
                PYTextViewFactory.buildView(params: params)
            case PYButtonView.identifier:
                PYButtonViewFactory.buildView(params: params)
            case PYCollectionCardView.identifier:
                PYCollectionCardViewFactory.buildView(params: params)
            default:
                EmptyView()
            }
        }
    }
}
