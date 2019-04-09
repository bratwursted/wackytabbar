//
//  FirstViewController.swift
//  WackyTab
//
//  Created by Bramhall, Joe on 3/26/19.
//  Copyright © 2019 Bramhall, Joe. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    static let CellIdentifier = "Cell"

    static let Formatter = ISO8601DateFormatter()

    var items = [Date]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Stories"

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCell(_:)))
        navigationItem.rightBarButtonItem = addButton

        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    @objc func addNewCell(_ sender: Any) {
        items.append(Date())
        tableView.reloadData()
    }
}

// MARK: - Table view data source
extension FirstViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewController.CellIdentifier) {
            configureCell(cell, forItemAt: indexPath)
            return cell
        }
        else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: FirstViewController.CellIdentifier)
            configureCell(cell, forItemAt: indexPath)
            return cell
        }
    }

    private func configureCell(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let cellDate = items[indexPath.row]
        cell.textLabel?.text = FirstViewController.Formatter.string(from: cellDate)
    }
}
