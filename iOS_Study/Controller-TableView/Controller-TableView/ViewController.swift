//
//  ViewController.swift
//  Controller-TableView
//
//  Created by 이태형 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    let tableViewData = [["1","2","3","4","5"],
                         ["1","2","3","4","5"],
                         ["1","2","3","4","5"],
                         ["1","2","3","4","5"],
                         ["1","2","3","4","5"]]
    var hiddenSceions = Set<Int>()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
}

extension ViewController{
    @objc func didTapSection(_ sender: UIButton){
        let section = sender.tag
//        var indexPaths = [IndexPath]()
//        for row in tableViewData[section].indices{
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
        let indexPaths = tableViewData[section].indices.map{ IndexPath(row: $0, section: section) }
        hiddenSceions.contains(section) ? showSection(section, indexPaths) : hideSection(section, indexPaths)
//        tableView.reloadData()
        
    }
    
    func hideSection(_ section: Int, _ indexPath: [IndexPath]){
        hiddenSceions.insert(section)
        tableView.deleteRows(at: indexPath, with: .fade)
    }
    func showSection(_ section: Int, _ indexPath: [IndexPath]){
        hiddenSceions.remove(section)
        tableView.insertRows(at: indexPath, with: .fade)
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hiddenSceions.contains(section) ? 0 : tableViewData[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tableViewData[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.tag = section
        button.setTitle(String(section), for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapSection(_:)), for: .touchUpInside)
        return button
    }
}

extension ViewController{
    private func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
