//
//  SplashScreenPresenter.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

// MARK: - SplashScreenPresenterDescription

protocol SplashScreenPresenterDescription {
    func present()
    func dismiss(completion: (() -> Void)?)
}

// MARK: - SplashScreenPresenter

final class SplashScreenPresenter: SplashScreenPresenterDescription {
    private lazy var foregroundSplashWindow: UIWindow = {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)
        splashWindow.windowLevel = .normal + 1
        splashWindow.rootViewController = SplashScreenViewController()
        return splashWindow
    }()

    func present() {
        foregroundSplashWindow.isHidden = false
    }

    func dismiss(completion _: (() -> Void)?) {}
}
