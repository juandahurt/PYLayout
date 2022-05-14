//
//  PYLayoutManager.swift
//  
//
//  Created by Juan Hurtado on 14/05/22.
//

import UIKit
import Foundation

public struct PYLayoutManager {
    public static let shared = PYLayoutManager()
    
    private init() {}
    
    public func configure() {
        registerFonts()
    }
}

extension PYLayoutManager {
    private func registerFonts() {
        let fonts = [
            PYResource(name: "Poppins-Regular", fileExtension: "ttf"),
            PYResource(name: "Poppins-Medium", fileExtension: "ttf"),
            PYResource(name: "Poppins-SemiBold", fileExtension: "ttf")
        ]
        fonts.forEach({ try? registerFont(from: $0.url)})
    }
    
    private func registerFont(from url: URL?) throws {
        guard let url = url else {
            throw FontRegisteringError.noFontFound
        }
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            throw FontRegisteringError.noFontDataProvider
        }
        guard let font = CGFont(fontDataProvider) else {
            throw FontRegisteringError.noFontFromFontDataProvider
        }
        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(font, &error) else {
            throw FontRegisteringError.errorInRegisteringFont(font: font, error: error!.takeRetainedValue())
        }
    }
}

public enum FontRegisteringError: Error {
    case noFontFound
    case noFontDataProvider
    case noFontFromFontDataProvider
    case errorInRegisteringFont(font: CGFont, error: CFError)
}
