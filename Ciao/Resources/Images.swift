//
//  Images.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

enum Images {
    case logo

    // MARK: - Images

    var image: UIImage? {
        return UIImage(named: name)
    }

    var name: String {
        switch self {
        case .logo:
            return "Logo"
        }
    }

    static func image(for imageCase: Images) -> UIImage {
        return imageCase.image ?? UIImage()
    }
}
