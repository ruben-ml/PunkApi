//
//  BeersTVCell.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 9/5/22.
//

import Foundation
import UIKit

class BeersTVCell: UITableViewCell, Reusable {
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.applySketchShadow(color: .systemGray3, x: 0, y: 0, blur: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var borderLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var beersData: Beers? {
        didSet{
            titleLabel.text = beersData?.name
        }
    }
    
    weak var presenter: BeersPresenter?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(infoView)
        infoView.addSubviews([borderLeftView, titleLabel])
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 11),
            infoView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            borderLeftView.topAnchor.constraint(equalTo: infoView.topAnchor),
            borderLeftView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            borderLeftView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            borderLeftView.widthAnchor.constraint(equalToConstant: 5)
        ])
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor)
        ])
    }
}
