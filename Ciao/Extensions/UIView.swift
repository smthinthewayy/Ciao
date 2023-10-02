//
//  UIView.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
