//
//  Images.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

enum Images {
    case logo
    case fork
    case spoon
    case circle

    // MARK: - Images

    var image: UIImage? {
        return UIImage(named: name)
    }

    var name: String {
        switch self {
        case .logo:
            return "Logo"
        case .fork:
            return "Fork"
        case .spoon:
            return "Spoon"
        case .circle:
            return "Circle"
        }
    }

    static func image(for imageCase: Images) -> UIImage {
        return imageCase.image ?? UIImage()
    }
}
