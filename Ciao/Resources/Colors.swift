//
//  Colors.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

enum Colors {
    case black
    case white
    case lightLimeGreen

    // MARK: - Colors

    var color: UIColor? {
        return UIColor(named: name)
    }

    var name: String {
        switch self {
        case .black:
            return "Black"
        case .white:
            return "White"
        case .lightLimeGreen:
            return "Light-Lime-Green"
        }
    }

    static func color(for colorCase: Colors) -> UIColor {
        return colorCase.color ?? .clear
    }
}
