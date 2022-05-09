//
//  ViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import UIKit
import Moya

class BeersViewController: UIViewController {
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableKey.titleLabel.localized
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    private lazy var searchBar: UISearchController = {
//        let search = UISearchController(searchResultsController: nil)
//        search.searchResultsUpdater = self
//        search.obscuresBackgroundDuringPresentation = false
//        search.searchBar.placeholder = LocalizableKey.placeholderSearch.localized
//        search.searchBar.sizeToFit()
//        search.searchBar.searchBarStyle = .prominent
//        search.delegate = self
//        return search
//    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(cellType: BeersTVCell.self)
        return table
    }()
    
    var presenter: BeersPresenter?
    
    init(presenter: BeersPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        presenter?.getBeers()
        view.addSubviews([titleLabel, tableView])
        setupNavigationUI()
    }

    private func setupNavigationUI() {

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

//extension BeersViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        self.tableView.reloadData()
//    }
//}
//
//extension BeersViewController: UISearchControllerDelegate {
//    
//}

extension BeersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: BeersTVCell.self)
        return cell
    }
}

extension BeersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
