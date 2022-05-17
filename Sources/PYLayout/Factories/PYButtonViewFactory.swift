//
//  PYButtonViewFactory.swift
//  
//
//  Created by Juan Hurtado on 17/05/22.
//

import Foundation
import SwiftUI

final class PYButtonViewFactory {
    static func buildView(params: [String: Any]? = nil) -> some View {
        let title = params?["title"] as? String ?? ""
        let deepLink = params?["deepLink"] as? String
        let fontSize = params?["fontSize"] as? Int ?? 12
        let handler = params?["handler"] as? PYButtonHandler
        var type: PYButtonType = .loud
        if let typeString = params?["type"] as? String {
            type = .init(rawValue: typeString) ?? .loud
        }
        return PYButtonView(title, fontSize: fontSize, type: type, deeplink: deepLink, handler: handler)
    }
}
