//
//  LoaderExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 23/05/22.
//

import Foundation
import SwiftUI
import Purace

struct LoaderExample: View {
    @State var percentage: Double = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .default).autoconnect()
    
    func updatePercentage() {
        percentage += 0.1
        if percentage >= 1 {
            percentage = 0
        }
    }
    
    var circularLoader: some View {
        VStack {
            Text("`PuraceCircularLoaderView()`")
            PuraceCircularLoaderView()
                .frame(width: 80, height: 80)
        }
    }
    
    var logoLoader: some View {
        VStack {
            Text("`PuraceLogoLoaderView()`")
            PuraceLogoLoaderView(percentage: $percentage)
                .frame(width: 80, height: 80)
                .onReceive(timer) { _ in
                    updatePercentage()
                }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                circularLoader
                logoLoader
            }
        }
    }
}
