//
//  ViewController.swift
//  ComponentSending
//
//  Created by 이태형 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    let textField = UITextField()
    let button = UIButton(type: .system)
    let stepper = UIStepper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(systemName: "gamecontroller")
        let imageView = UIImageView(image: image)
        navigationItem.titleView = imageView
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(stepper)
        
        textField.frame = CGRect(x: view.frame.midX-100, y: view.frame.midY-30, width: 200, height: 60)
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 4
        
        textField.delegate = self
        
        button.setTitle("Next", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: view.frame.midX - (button.frame.width / 2), y: view.frame.midY + 40)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        //stepper : 고유의 사이즈 존재
        stepper.frame.origin = CGPoint(x: view.frame.midX - (stepper.frame.width / 2), y: view.frame.midY - 100)
        stepper.stepValue = 2  //2씩 증가 (defaut Max = 100)
        stepper.autorepeat = true
        stepper.addTarget(self, action: #selector(didTapStepper(_:)), for: .valueChanged)
    }

    @objc func didTapButton(_ sender: UIButton){
        let nextVC = SecondViewController()
        nextVC.label.text = textField.text ?? ""
        present(nextVC , animated: true)
    }
    
    @objc func didTapStepper(_ sender: UIStepper){
        textField.text = String(sender.value)
    }

}

//Delegate Pattern
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(textField.text)
        return true
    }
}
