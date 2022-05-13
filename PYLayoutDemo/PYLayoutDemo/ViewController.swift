//
//  ViewController.swift
//  PYLayoutDemo
//
//  Created by Juan Hurtado on 13/05/22.
//

import SwiftUI
import UIKit
import PYLayout

struct FeedView: View {
    func buildBody() -> some View {
        let factory = PYSwiftUIViewFactory()
        return factory.buildView(
            withLayout: .text,
            params: [
                "text": "hola a tdodos",
                "fontSize": 20
            ]
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            buildBody()
        }
    }
}
