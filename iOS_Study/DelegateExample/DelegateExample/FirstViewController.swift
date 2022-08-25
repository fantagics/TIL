//
//  ViewController.swift
//  DelegateExample
//
//  Created by 이태형 on 2022/08/24.
//

import UIKit

class FirstViewController: UIViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nextVC = SecondViewController()
        nextVC.label.text = "SecondViewController"
        nextVC.delegate = self
        present(nextVC, animated: true)
    }
    
}

extension FirstViewController: SecondViewControllerDelegate{
    func didDismissed(text: String) {
        label.text = DataManager.shared.text
//        label.text = text
    }
}

extension FirstViewController{
    func setUI(){
        label.text = "FirstViewController"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
