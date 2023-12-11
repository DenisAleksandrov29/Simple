//
//  MainViewController + TableView.swift
//  Simple-
//
//  Created by Денис Александров on 06.12.2023.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
    }
    
    func reloadTableview() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCell() {
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier,
                                                       for: indexPath) as? MainCell else {
            return UITableViewCell()
            
        }
    
    let cellViewModel = cellDataSource[indexPath.row]
    cell.setupcell(viewModel: cellViewModel)
    
    return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = viewModel.dataSource else { return }
        pressentDetailsViewController(user: dataSource[indexPath.row])
    }
}
