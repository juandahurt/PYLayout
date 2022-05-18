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
        var topMargin: Double = .zero
        var bottomMargin: Double = .zero
        var leftMargin: Double = .zero
        var rightMargin: Double = .zero
        if let margin = params?["margin"] as? [String: Double] {
            topMargin = margin["top"] ?? .zero
            bottomMargin = margin["bottom"] ?? .zero
            leftMargin = margin["left"] ?? .zero
            rightMargin = margin["right"] ?? .zero
        }
        return Group {
            Group {
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
                .padding(.top, topMargin)
                .padding(.bottom, bottomMargin)
                .padding(.leading, leftMargin)
                .padding(.trailing, rightMargin)
        }
            
    }
}
