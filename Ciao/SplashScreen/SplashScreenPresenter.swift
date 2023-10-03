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
    // MARK: - Properties

    private lazy var animator: SplashScreenAnimatorDescription = SplashScreenAnimator(
        foregroundSplashWindow: foregroundSplashWindow,
        backgroundSplashWindow: backgroundSplashWindow
    )

    private lazy var foregroundSplashWindow: UIWindow = splashWindow(level: .normal + 1, rootViewController: SplashScreenViewController())

    private lazy var backgroundSplashWindow: UIWindow = splashWindow(level: .normal - 1, rootViewController: SplashScreenViewController())

    // MARK: - Setup

    private func splashWindow(level: UIWindow.Level, rootViewController: SplashScreenViewController) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)
        splashWindow.windowLevel = level
        splashWindow.rootViewController = rootViewController
        return splashWindow
    }

    // MARK: - Methods

    func present() {
        animator.animateAppearance()
    }

    func dismiss(completion: (() -> Void)?) {
        animator.animateDisappearance(completion: completion)
    }
}
