//
//  SecondViewController.swift
//  ComponentSending
//
//  Created by 이태형 on 2022/08/03.
//

import UIKit

class SecondViewController: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.frame = CGRect(x: view.frame.midX-100, y: view.frame.midY - 40, width: 200, height: 40)
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 4
        label.textAlignment = .center
        
        button.setTitle("alert", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: view.frame.midX - (button.frame.width / 2), y: view.frame.midY + 40)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "경고", message: "마지막화면입니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {_ in print("취소버튼이 눌렸습니다.")})
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: {_ in print(alertController.textFields?.first?.text)})
        
        alertController.addTextField(configurationHandler: {textfield in
            textfield.keyboardType = .numberPad
        })
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true)
    }
    

// MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
    
}
