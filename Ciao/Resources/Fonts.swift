//
//  Fonts.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

// MARK: - Fonts

enum Fonts {
    case title1
    case title2
    case body
    case callout
    case button
    case footnote

    // MARK: - Font Styles

    var font: UIFont? {
        return UIFont(name: name, size: fontSize)
    }

    var name: String {
        switch self {
        case .title1, .title2, .button:
            return FontsNames.ptRootUIBold
        case .body, .callout, .footnote:
            return FontsNames.ptRootUIMedium
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .title1:
            return 28
        case .title2:
            return 20
        case .body, .button:
            return 17
        case .callout:
            return 16
        case .footnote:
            return 14
        }
    }

    static func font(for fontStyle: Fonts) -> UIFont {
        return fontStyle.font!
    }
}

// MARK: - FontsNames

private enum FontsNames {
    static let ptRootUILight = "PTRootUI-Light"
    static let ptRootUIRegular = "PTRootUI-Regular"
    static let ptRootUIMedium = "PTRootUI-Medium"
    static let ptRootUIBold = "PTRootUI-Bold"
}
