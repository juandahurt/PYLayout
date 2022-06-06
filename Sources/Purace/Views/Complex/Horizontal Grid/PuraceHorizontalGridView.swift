//
//  PuraceHorizontalGridView.swift
//  
//
//  Created by Juan Hurtado on 5/06/22.
//

import Foundation
import SwiftUI

public struct PuraceHorizontalGridView: View {
    let views: [AnyView]
    let stacks: [PuraceHGridVerticalStack]
    
    public init<Views>(@ViewBuilder content: @escaping () -> TupleView<Views>) {
        self.views = content().getViews
        stacks = [
            .init(contents: [
                .subStack(axis: .horizontal, children: [
                    .leaf(content: [views[0]]),
                    .subStack(axis: .vertical, children: [
                        .leaf(content: [views[0]]),
                        .leaf(content: [views[0]]),
                    ])
                ]),
                .subStack(axis: .horizontal, children: [
                    .leaf(content: [views[0]])
                ])
            ]),
            .init(contents: [
                .subStack(axis: .horizontal, children: [
                    .leaf(content: [views[0]]),
                ]),
                .subStack(axis: .horizontal, children: [
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views[0]]),
                        .leaf(content: [views[0]]),
                    ])
                ])
            ])
        ]
    }
    
    
    public var body: some View {
        GeometryReader { reader in
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(stacks.indices) { index in
                        PuraceHGridVerticalStack(contents: stacks[index].contents)
                            .frame(width: stacks.count == 1 ? reader.size.width : reader.size.width * 0.9)
                    }
                }
            }
        }
    }
}
