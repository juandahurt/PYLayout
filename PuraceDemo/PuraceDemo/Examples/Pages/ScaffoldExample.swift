//
//  ScaffoldExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 7/08/22.
//

import Foundation
import SwiftUI
import Purace

struct ScaffoldExample: View {
    @State var showError = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        PuraceScaffold(navBar: .init(title: "This is an example", backOnTap: {
            presentationMode.wrappedValue.dismiss()
        })) {
            PuraceScaffoldContent {
                VStack {
                    PuraceButtonView("Toggle error") {
                        showError.toggle()
                    }
                }
            }.genericErrorView(isPresented: $showError) {
                print("error retry callback has been called")
            }
        }
        .navigationBarHidden(true)
    }
}
