//
//  PuraceScaffold.swift
//  
//
//  Created by Juan Hurtado on 7/08/22.
//

import Foundation
import SwiftUI

public struct PuraceScaffold<Content: View>: View {
    var navBar: PuraceScaffoldNavBar?
    var content: () -> Content
    
    public init(navBar: PuraceScaffoldNavBar? = nil, content: @escaping () -> Content) {
        self.navBar = navBar
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if let navBar {
                navBar
            }
            content()
            Spacer(minLength: 0)
        }
    }
}

public struct PuraceScaffoldContent<Content: View>: View {
    public var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
    }
}
