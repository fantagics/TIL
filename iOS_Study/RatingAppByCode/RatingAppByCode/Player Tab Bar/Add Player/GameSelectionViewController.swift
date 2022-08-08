//
//  GameSelectionViewController.swift
//  RatingAppByCode
//
//  Created by 이태형 on 2022/08/08.
//

import UIKit

class GameSelectionViewController: UIViewController {
    let tableView = UITableView()
    let games = ["Angry Bird", "Chese", "Russian Rullet","Spin the bottle", "Taxas Hold'em Poker","Tic-Tac-Toe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.isScrollEnabled = false
    }
    
}

extension GameSelectionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = games[indexPath.row]
        cell.contentConfiguration = content
        cell.selectionStyle = .none
//        indexPath.row == 1 ? cell.accessoryType = .checkmark : nil
        
        return cell
    }
}

extension GameSelectionViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark
    }
}
