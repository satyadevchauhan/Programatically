//
//  MainViewController.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var viewModel = ListViewModel()
    
    convenience init(viewModel: ListViewModel = ListViewModel()) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
        setupRefreshView()
        setupTableView()
        setupViewModelClosure()
        
        refreshData()
    }
}
    
// MARK: - Setup

extension MainViewController {
    
    fileprivate func setupNavigation() {
        title = viewModel.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(filterData))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
    }
    
    fileprivate func setupRefreshView() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action:#selector(refreshData), for: .valueChanged)
        refreshControl?.tintColor = .red
    }
    
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.reuseId)
    }
    
    fileprivate func setupViewModelClosure() {
        
        viewModel.showLoading = { [weak self] in
            self?.refreshControl?.beginRefreshing()
        }
        
        viewModel.hideLoading = { [weak self] in
            self?.refreshControl?.endRefreshing()
        }
        
        viewModel.dataLoaded = { [weak self] in
            self?.tableView.reloadData()
            self?.title = self?.viewModel.name
        }
        
        viewModel.alert = { [weak self] (title, message)in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.showAlert(title: title, message: message, completion: nil)
            }
        }
    }
}

// MARK: - Actions

extension MainViewController {
    
    @objc func refreshData() {
        viewModel.getList()
    }
    
    @objc func filterData() {
        showActionSheet(items: viewModel.filterOptions)
    }

}

// MARK: - UITableViewDataSource

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseId, for: indexPath) as! ItemTableViewCell
        cell.model = viewModel.list?[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel.list?[indexPath.row] {
            let detail = DetailViewController(item: item)
            navigationController?.pushViewController(detail, animated: true)
        }
    }
}

// MARK: - Filter Action Sheet

extension MainViewController {
    
    fileprivate func showActionSheet(items: [ItemType]) {
        
        let alert = UIAlertController(title: "", message: "Filter".localized, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "All".localized, style: .default, handler: { [weak self] (_) in
            print("User click on All")
            self?.viewModel.filter()
        }))
        
        items.forEach { (itemType) in
            alert.addAction(UIAlertAction(title: itemType.rawValue.capitalized, style: .default, handler: { [weak self] (_) in
                print("User click on \(itemType)")
                self?.viewModel.filter(type: itemType)
            }))
        }

        alert.addAction(UIAlertAction(title: "Dismiss".localized, style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))

        present(alert, animated: true, completion: nil)
    }
}

