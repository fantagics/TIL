//
//  ViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 이태형 on 2022/10/12.
//

import UIKit

protocol LoginVIewControllerDelegate{
    func login()
}

class LoginViewController: UIViewController {
    var delegate: LoginVIewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonItem = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(didTapButton(_:)))
        navigationItem.rightBarButtonItem = buttonItem
        
    }
    
    deinit{
        print("\(type(of: self))")
    }

    @objc func didTapButton(_ sender: UIBarButtonItem){
        delegate?.login()
    }

}

