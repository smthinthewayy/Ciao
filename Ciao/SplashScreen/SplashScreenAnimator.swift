//
//  SplashScreenAnimator.swift
//  Ciao
//
//  Created by Danila Belyi on 03.10.2023.
//

import UIKit

// MARK: - SplashScreenAnimatorDescription

protocol SplashScreenAnimatorDescription {
    func animateAppearance()
    func animateDisappearance(completion: (() -> Void)?)
}

// MARK: - SplashScreenAnimator

final class SplashScreenAnimator: SplashScreenAnimatorDescription {
    // MARK: - Properties

    private unowned let foregroundSplashWindow: UIWindow
    private unowned let foregroundSplashViewController: SplashScreenViewController

    private unowned let backgroundSplashWindow: UIWindow
    private unowned let backgroundSplashViewController: SplashScreenViewController

    // MARK: - Initialization

    init(foregroundSplashWindow: UIWindow, backgroundSplashWindow: UIWindow) {
        self.foregroundSplashWindow = foregroundSplashWindow
        self.backgroundSplashWindow = backgroundSplashWindow

        guard let foregroundSplashViewController = foregroundSplashWindow.rootViewController as? SplashScreenViewController,
              let backgroundSplashViewController = backgroundSplashWindow.rootViewController as? SplashScreenViewController
        else {
            fatalError("splash window does not have root view controller")
        }

        self.foregroundSplashViewController = foregroundSplashViewController
        self.backgroundSplashViewController = backgroundSplashViewController
    }

    func animateAppearance() {
        foregroundSplashWindow.isHidden = false
        animateSpoonImage()
        animateForkImage()
    }

    func animateDisappearance(completion _: (() -> Void)?) {
        guard let window = UIApplication.shared.delegate?.window, let mainWindow = window else { fatalError("App delegate does not have a window") }

        foregroundSplashWindow.alpha = 0
        backgroundSplashWindow.isHidden = false

        let mask = CALayer()
        mask.frame = foregroundSplashViewController.circleView.frame
        mask.contents = SplashScreenViewController.circleImage.cgImage
        mainWindow.layer.mask = mask

        addScalingAnimation(to: mask, duration: 0.6)
    }

    private func animateSpoonImage() {
        UIView.animate(withDuration: 0.4, delay: 0.5) {
            self.foregroundSplashViewController.spoonImage.transform = CGAffineTransform(translationX: 0, y: 120)
        }
    }

    private func animateForkImage() {
        UIView.animate(withDuration: 0.4, delay: 0.6) {
            self.foregroundSplashViewController.forkImage.transform = CGAffineTransform(translationX: 0, y: 120)
        }
    }

    private func addScalingAnimation(to layer: CALayer, duration: TimeInterval) {
        let animation = CAKeyframeAnimation(keyPath: "bounds")
        let width = layer.frame.width
        let height = layer.frame.height
        let coef: CGFloat = 10 / 706
        let finalScale = coef * UIScreen.main.bounds.height
        let scales: [CGFloat] = [1, finalScale]

        animation.beginTime = CACurrentMediaTime()
        animation.duration = duration
        animation.values = scales.map { NSValue(cgRect: CGRect(x: 0, y: 0, width: width * $0, height: height * $0)) }
        animation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                                     CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        layer.add(animation, forKey: "bounds")
    }
}
