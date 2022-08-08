//
//  ViewController.swift
//  RatingAppByCode
//
//  Created by 이태형 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    let titles = ["Bill Evans", "Oscar Peterson", "Dave Brubeck"]
    let subTitles = ["Tic-Tac-Toe", "Spin the Bottle", "Taxas Hold'em Poker"]
    let stars = ["4Stars", "5Stars", "2Stars"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonDidTapped(_:)))
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
//        tableView.backgroundColor = UIColor.red
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        
    }

    @objc func barButtonDidTapped(_ sender: UIBarButtonItem){
//        print(#function)
//        present(AddPlayerViewController(), animated: true)
        let navVC = UINavigationController(rootViewController: AddPlayerViewController())
        present(navVC, animated: true)
    }

    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else{fatalError()}
        
        cell.accessoryType = .disclosureIndicator
        cell.myTitle.text = titles[indexPath.row]
        cell.myTitle.sizeToFit()
        cell.mySubtitle.text = subTitles[indexPath.row]
        cell.mySubtitle.sizeToFit()
        cell.myImageView.image = UIImage(named: stars[indexPath.row])
        
        return cell
    }
}
