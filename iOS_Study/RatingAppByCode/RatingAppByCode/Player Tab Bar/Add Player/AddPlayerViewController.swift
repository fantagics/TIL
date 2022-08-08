//
//  AddPlayerViewController.swift
//  RatingAppByCode
//
//  Created by 이태형 on 2022/08/01.
//

import UIKit

class AddPlayerViewController: UIViewController {
    //이 구역의 let들은 생성 시점 순서가 불확실(랜덤)하다
    let tableView = UITableView(frame: .zero, style: .grouped)
    lazy var cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapBarButtonItem(_:)))
    lazy var doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapBarButtonItem(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Player"
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = doneBarButtonItem
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        tableView.register(AddPlayerTextFieldTableViewCell.self, forCellReuseIdentifier: AddPlayerTextFieldTableViewCell.identifier)
    }
    
    @objc func didTapBarButtonItem(_ sender: UIBarButtonItem){
        switch sender {
        case cancelBarButtonItem:
            print("Cancel")
            dismiss(animated: true, completion: nil)
        case doneBarButtonItem:
            print("Done")
        default:
            fatalError()
        }
    }
}

extension AddPlayerViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "Player Name" : nil
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPlayerTextFieldTableViewCell.identifier, for: indexPath) as? AddPlayerTextFieldTableViewCell else{fatalError()}
            
            return cell
        case 1:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
//            cell.textLabel?.text = "Game"  //지원은 하지만 사라질 방식
            //권장방식:
            var content = cell.defaultContentConfiguration()
            content.text = "Game"
            content.secondaryText = "Detail"
            content.secondaryTextProperties.color = .black
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
            cell.contentConfiguration = content
            cell.selectionStyle = .none
            
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            fatalError()
        }
    }
}

extension AddPlayerViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard indexPath.section ==1 else{return}
        if indexPath.section == 1 && indexPath.row == 0{
            navigationController?.pushViewController(GameSelectionViewController(), animated: true)
        }
    }
}
