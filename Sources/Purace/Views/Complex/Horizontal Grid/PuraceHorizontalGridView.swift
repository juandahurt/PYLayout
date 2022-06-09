//
//  PuraceHorizontalGridView.swift
//  
//
//  Created by Juan Hurtado on 5/06/22.
//

import Foundation
import SwiftUI
import ViewExtractor

public struct PuraceHorizontalGridView: View {
    let views: [AnyView]
    let numberOfViews: Int
    @State var stacks: [PuraceHGridVerticalStack] = []
    
    public init<Views>(@ViewBuilder content: TupleContent<Views>) {
        views = ViewExtractor.getViews(from: content)
        numberOfViews = views.count
    }
    
    public init<Content: View>(@ViewBuilder content: NormalContent<Content>) {
        views = ViewExtractor.getViews(from: content)
        numberOfViews = views.count
    }
    
    func getNumberOfViewsPerStack() -> [Int] {
        let min = Swift.min(2, numberOfViews)
        let max = Swift.min(5, numberOfViews)
        var acc = 0
        var viewsPerStack = [Int]()
        while acc < numberOfViews {
            var random: Int = .random(in: min...max)
            if acc + random > numberOfViews {
                while random + acc > numberOfViews {
                    random -= 1
                }
            }
            acc += random
            viewsPerStack.append(random)
        }
        return viewsPerStack
    }
    
    func buildStack(of numberOfViews: Int, index: Int, views: inout [AnyView]) -> PuraceHGridVerticalStack {
        assert(numberOfViews > 0 && numberOfViews <= 5)
        switch numberOfViews {
        case 1:
            return .init(contents: [
                .leaf(content: [views.popLast()!])
            ])
        case 2:
            return .init(contents: [
                .leaf(content: [views.popLast()!]),
                .leaf(content: [views.popLast()!])
            ])
        case 3:
            let alpha: Double = .random(in: 0...1)
            if alpha < 0.5 {
                return .init(contents: [
                    .leaf(content: [views.popLast()!]),
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .leaf(content: [views.popLast()!])
                    ])
                ])
            } else {
                return .init(contents: [
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .leaf(content: [views.popLast()!])
                    ]),
                    .leaf(content: [views.popLast()!])
                ])
            }
        case 4:
            return .init(contents: [
                .subStack(axis: .horizontal, children: [
                    .leaf(content: [views.popLast()!]),
                    .leaf(content: [views.popLast()!])
                ]),
                .subStack(axis: .horizontal, children: [
                    .leaf(content: [views.popLast()!]),
                    .leaf(content: [views.popLast()!])
                ])
            ])
        default:
            let alpha: Double = .random(in: 0...1)
            if alpha < 0.5 {
                return .init(contents: [
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .leaf(content: [views.popLast()!])
                    ]),
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .subStack(axis: .vertical, children: [
                            .leaf(content: [views.popLast()!, views.popLast()!])
                        ])
                    ])
                ])
            } else {
                return .init(contents: [
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .subStack(axis: .vertical, children: [
                            .leaf(content: [views.popLast()!, views.popLast()!])
                        ])
                    ]),
                    .subStack(axis: .horizontal, children: [
                        .leaf(content: [views.popLast()!]),
                        .leaf(content: [views.popLast()!])
                    ]),
                ])
            }
        }
    }
    
    func buildStacks() {
        let viewsPerStack = getNumberOfViewsPerStack()
        var viewsCopy = views
        for (index, numberOfViews) in viewsPerStack.enumerated() {
            let stack = buildStack(of: numberOfViews, index: index, views: &viewsCopy)
            stacks.append(stack)
        }
    }
    
    public var body: some View {
        GeometryReader { reader in
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(stacks.indices, id: \.self) { index in
                        PuraceHGridVerticalStack(contents: stacks[index].contents)
                            .frame(width: stacks.count == 1 ? reader.size.width : reader.size.width * 0.9)
                    }
                }
            }
        }.onAppear {
            buildStacks()
        }
    }
}
