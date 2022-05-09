//
//  ViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Beers list"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(titleLabel)
        setupNavigationUI()
    }

    private func setupNavigationUI() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

