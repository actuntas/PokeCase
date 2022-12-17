//
//  HomeViewController.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
}

extension HomeViewController: HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .updateTite(let title):
            self.title = title
        case .isLoading(let isLoading):
            isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        case .displayItems:
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeue(at: indexPath)
        let pokemon = presenter.pokemon(at: indexPath.row)
        cell.populate(with: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectItem(at: indexPath.row)
    }
}
