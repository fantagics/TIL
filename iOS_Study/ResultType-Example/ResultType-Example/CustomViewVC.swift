//
//  CustomViewVC.swift
//  ResultType-Example
//
//  Created by 이태형 on 2022/09/07.
//

import UIKit

class CustomViewVC: UIViewController {

//    let mainLogoButton = MainLogoButton(title: "Logo")
    let mainLogoButton: [UIButton] = ["Logo", "Logo2", "Logo3"].map { title in
        return MainLogoButton(title: title)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
}

extension CustomViewVC{
    func setUI(){
//        mainLogoButton.setTitle("LOGO", for: .normal)
//        mainLogoButton.layer.cornerRadius = 4
//        mainLogoButton.layer.borderColor = UIColor.systemBlue.cgColor
//        mainLogoButton.layer.borderWidth = 1
        
//        view.addSubview(mainLogoButton)
//        mainLogoButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            mainLogoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mainLogoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
        
        for (index, button) in mainLogoButton.enumerated(){
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            switch index{
            case 0:
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            case 1:
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            case 2:
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
            default:
                print("x")
            }
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
}
