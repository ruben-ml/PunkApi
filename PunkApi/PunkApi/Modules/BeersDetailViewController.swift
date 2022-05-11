//
//  BeersDetailViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 10/5/22.
//
import Foundation
import UIKit

class BeersDetailViewController: UIViewController {
    
    private lazy var contentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleNameLabel, beerImage, taglineLabel, firstBrewedLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstBrewedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var beerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var beersDetailData: Beers? {
        didSet{
            titleNameLabel.text = beersDetailData?.name
            taglineLabel.text = beersDetailData?.tagline
            firstBrewedLabel.text = beersDetailData?.firstBrewed
            descriptionLabel.text = beersDetailData?.description
            ImageLoader.loadImage(beersDetailData?.imageURL, in: beerImage)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(titleNameLabel)
        setupUI()
    }
    
    private func setupUI() {
//        NSLayoutConstraint.activate([
//            contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        NSLayoutConstraint.activate([
            titleNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ])
    }
    
    
}
