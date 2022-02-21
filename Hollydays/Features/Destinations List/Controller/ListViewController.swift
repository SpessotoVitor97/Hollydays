//
//  ListViewController.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 20/02/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = DestinationsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getDestinations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: DestinationTableViewCell.self), bundle: nil), forCellReuseIdentifier: DestinationTableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = viewModel.getTotalDestinations()
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DestinationTableViewCell.description(), for: indexPath) as? DestinationTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(for: viewModel.destinations![indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDestination = viewModel.destinations![indexPath.item]
        let destinationViewModel = DestinationDetailsViewModel(destination: selectedDestination)
        let detailsViewController = DestinationDetailsViewController(viewModel: destinationViewModel)
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
