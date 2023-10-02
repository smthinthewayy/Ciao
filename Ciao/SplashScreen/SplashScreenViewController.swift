//
//  SplashScreenViewController.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

class SplashScreenViewController: UIViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.image(for: .logo)
        return imageView
    }()

    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        label.text = "Ciao!"
        label.font = Fonts.font(for: .title1)
        label.textColor = Colors.color(for: .black)
        return label

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSubviews()
        setupConstraints()
    }

    override func viewDidLayoutSubviews() {
        appNameLabel.transform = CGAffineTransform(translationX: 0, y: 10)
        UIView.animate(withDuration: 0.2) { self.appNameLabel.transform = .identity }
        UIView.animate(withDuration: 0.1) { self.appNameLabel.alpha = 1 }
    }

    private func setupView() {
        view.backgroundColor = Colors.color(for: .lightLimeGreen)
    }

    private func setupSubviews() {
        view.addSubviews([logoImageView, appNameLabel])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 180),
            logoImageView.widthAnchor.constraint(equalToConstant: 180),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -36),

            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            appNameLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
        ])
    }
}
