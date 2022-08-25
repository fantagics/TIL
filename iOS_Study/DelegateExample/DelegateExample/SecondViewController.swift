//
//  SecondViewController.swift
//  DelegateExample
//
//  Created by 이태형 on 2022/08/24.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject{
    func didDismissed(text: String)
}

class SecondViewController: UIViewController {
    let label = UILabel()
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setUI()
    }
    
    deinit{
        DataManager.shared.text = "Dismissed(Singleton)"
        delegate?.didDismissed(text: "Dismissed")
    }
}

extension SecondViewController{
    func setUI(){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

