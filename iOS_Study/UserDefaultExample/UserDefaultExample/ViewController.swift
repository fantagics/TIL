//
//  ViewController.swift
//  UserDefaultExample
//
//  Created by 이태형 on 2022/08/26.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }


}

extension ViewController{
    func save(text: String){
        UserDefaults.standard.set(text, forKey: "label")
    }
    func load() -> String{
        return UserDefaults.standard.string(forKey: "label") ?? "Blank"
    }
}

extension ViewController{
    @objc func didTapButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "", message: "텍스트를 입력하세요", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
            guard let text = alertController.textFields?.first?.text else{return}
            self.label.text = text
            self.save(text: text)
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        alertController.addTextField()
        present(alertController, animated: true)
    }
}

extension ViewController{
    private func setUI(){
        label.text = load()
        button.setTitle("button", for: .normal)
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
