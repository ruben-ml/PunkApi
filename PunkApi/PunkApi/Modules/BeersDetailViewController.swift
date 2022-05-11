//
//  BeersDetailViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 10/5/22.
//
import Foundation
import UIKit

class BeersDetailViewController: UIViewController {
    
    
    lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstBrewedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beerImage: UIImageView = {
        let imageView = UIImageView()
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
    }
}
