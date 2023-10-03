//
//  AppDelegate.swift
//  Ciao
//
//  Created by Danila Belyi on 29.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private var splashScreenPresenter: SplashScreenPresenterDescription? = SplashScreenPresenter()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        splashScreenPresenter?.present()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.splashScreenPresenter?.dismiss(completion: { [weak self] in
                self?.splashScreenPresenter = nil
            })
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
