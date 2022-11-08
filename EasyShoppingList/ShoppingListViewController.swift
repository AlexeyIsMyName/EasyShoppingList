//
//  ShoppingListViewController.swift
//  EasyShoppingList
//
//  Created by ALEKSEY SUSLOV on 08.11.2022.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDataSource {
    
    private lazy var shoppingListTableView = setupShoppingListTable()
    private let cellID = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        shoppingListTableView.dataSource = self
    }
}

// MARK: - Working with UI
extension ShoppingListViewController {
    private func setupShoppingListTable() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    private func setupView() {
        title = "Shopping List"
        view.backgroundColor = .white
        view.addSubview(shoppingListTableView)
        
        NSLayoutConstraint.activate([
            shoppingListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            shoppingListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            shoppingListTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            shoppingListTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0)
        ])
    }
}


// MARK: - shoppingListTableView data source
extension ShoppingListViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Shopping Item"
        cell.contentConfiguration = content
        return cell
    }
}
