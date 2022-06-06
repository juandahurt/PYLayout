//
//  PuraceHGridVerticalStack.swift
//  
//
//  Created by Juan Hurtado on 6/06/22.
//

import Foundation
import SwiftUI

struct PuraceHGridVerticalStack: View {
    let contents: [PuraceHGridStackContent]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(contents) { content in
                if case let .subStack(axis: axis, children: contents) = content {
                    switch axis {
                    case .vertical:
                        PuraceHGridVerticalStack(contents: contents)
                    case .horizontal:
                        PuraceHGridHorizontalStack(contents: contents)
                    }
                }
                
                if case let .leaf(content: views) = content {
                    ForEach(views.indices) { index in
                        views[index]
                    }
                }
            }
        }
    }
}
