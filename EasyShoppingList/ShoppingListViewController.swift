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
    
    private var shoppingList = ["Shopping Item", "Shopping Item", "Shopping Item", "Shopping Item", "Shopping Item"]

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
        
        // Add Button to navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewItem)
        )
    }
}

// MARK: - Busines methods
extension ShoppingListViewController {
    @objc private func addNewItem() {
        let ac = UIAlertController(title: "Adding new item",
                                   message: "What do you want to buy?",
                                   preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = ac.textFields?[0].text else { return }
            self.shoppingList.append(text)
            self.shoppingListTableView.reloadData()
        }
        
        ac.addTextField()
        ac.addAction(action)
        
        present(ac, animated: true)
    }
}


// MARK: - ShoppingListTableView Data Source
extension ShoppingListViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = shoppingList[indexPath.row] + " " + String(indexPath.row + 1)
        cell.contentConfiguration = content
        return cell
    }
}
