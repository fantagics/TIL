//
//  MainViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 이태형 on 2022/10/12.
//

import UIKit

protocol MainViewControllerDelegate{
    func logout()
}

class MainViewController: UIViewController {
    var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(didTapButton(_:)))
        navigationItem.rightBarButtonItem = buttonItem
    }

    @objc func didTapButton(_ sender: UIBarButtonItem){
        delegate?.logout()
    }
}
