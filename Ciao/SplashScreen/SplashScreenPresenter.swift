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
    private lazy var animator: SplashScreenAnimatorDescription = SplashScreenAnimator(foregroundSplashWindow: foregroundSplashWindow, backgroundSplashWindow: backgroundSplashWindow)
    
    private lazy var foregroundSplashWindow: UIWindow = {
        return splashWindow(level: .normal + 1, rootViewController: SplashScreenViewController())
    }()
    
    private lazy var backgroundSplashWindow: UIWindow = {
        return splashWindow(level: .normal - 1, rootViewController: SplashScreenViewController())
    }()
    
    private func splashWindow(level: UIWindow.Level, rootViewController: SplashScreenViewController ) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)
        splashWindow.windowLevel = level
        splashWindow.rootViewController = rootViewController
        return splashWindow
    }

    func present() {
        animator.animateApperance()
    }

    func dismiss(completion: (() -> Void)?) {
        animator.animateDisappearance(completion: completion)
    }
}
