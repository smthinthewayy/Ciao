//
//  SplashScreenViewController.swift
//  Ciao
//
//  Created by Danila Belyi on 02.10.2023.
//

import UIKit

class SplashScreenViewController: UIViewController {
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.color(for: .white)
        view.layer.cornerRadius = 140 / 2
        view.clipsToBounds = true
        return view
    }()

    private let forkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.image(for: .fork)
//        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.cornerRadius = 8
//        imageView.clipsToBounds = true
//        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private let spoonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.image(for: .spoon)
//        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.cornerRadius = 8
//        imageView.clipsToBounds = true
//        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private let appNameLabel: UILabel = {
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
//        appNameLabel.transform = CGAffineTransform(translationX: 0, y: 10)
//        UIView.animate(withDuration: 0.2) { self.appNameLabel.transform = .identity }
        UIView.animate(withDuration: 0.2) { self.appNameLabel.alpha = 1 }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.4) {
                self.spoonImage.transform = CGAffineTransform(translationX: 0, y: 120)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
            UIView.animate(withDuration: 0.4) {
                self.forkImage.transform = CGAffineTransform(translationX: 0, y: 120)
            }
        }
    }

    private func setupView() {
        view.backgroundColor = Colors.color(for: .lightLimeGreen)
    }

    private func setupSubviews() {
        view.addSubviews([circleView, appNameLabel])
        circleView.addSubviews([forkImage, spoonImage])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleView.heightAnchor.constraint(equalToConstant: 140),
            circleView.widthAnchor.constraint(equalToConstant: 140),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -36),

            forkImage.widthAnchor.constraint(equalToConstant: 28),
            spoonImage.widthAnchor.constraint(equalToConstant: 32.7),

            forkImage.leftAnchor.constraint(equalTo: circleView.leftAnchor, constant: 17),
            forkImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 22),

            spoonImage.leftAnchor.constraint(equalTo: forkImage.rightAnchor, constant: 10),
            spoonImage.centerYAnchor.constraint(equalTo: forkImage.centerYAnchor),

            appNameLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 20),
            appNameLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
        ])
    }
}
