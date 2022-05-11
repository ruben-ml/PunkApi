//
//  ViewController.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import UIKit
import Moya

protocol BeersViewApi {
    func getBeers()
    func didPressCell(indexPath: IndexPath)
}
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

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.tableHeaderView = searchBar
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.estimatedRowHeight = 70
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.rowHeight = UITableView.automaticDimension
        table.register(cellType: BeersTVCell.self)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var beers = [Beers]()
    var filteredBeers = [Beers]()
    var presenter: BeersPresenter
    var networkProvider: Networkable
    var searching: Bool = false
    init(presenter: BeersPresenter, networkProvider: Networkable) {
        self.presenter = presenter
        self.networkProvider = networkProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubviews([titleLabel, tableView])
        presenter.viewDidLoad()
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BeersViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else { return }
        if searchText != "" {
            
            let searchFilteredFoods = beers.filter({
                $0.name.localizedCaseInsensitiveContains(searchText)
                
            })
            
            beers.removeAll()
            beers = searchFilteredFoods
            
        } else {
            beers.removeAll()
            beers = filteredBeers
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.tableView.reloadData()
    }
}

extension BeersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredBeers.count
        }else {
            return beers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: BeersTVCell.self)
        if searching {
            cell.beersData = filteredBeers[indexPath.row]
        }
        cell.beersData = beers[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension BeersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectCellAtIndexPath(indexPath: indexPath)
    }
}

extension BeersViewController: BeersViewApi {
    func didPressCell(indexPath: IndexPath) {
        let view = BeersDetailViewController()
        view.beersDetailData = beers[indexPath.row]
        let navView = UINavigationController(rootViewController: view)
        AppDelegate.sharedAppDelegate()?.showViewController(navView, addTransition: true)
    }
    
    func getBeers() {
        networkProvider.getBeers { data in
            self.beers = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
