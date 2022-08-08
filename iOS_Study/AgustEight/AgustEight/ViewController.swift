//
//  ViewController.swift
//  AgustEight
//
//  Created by 이태형 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
//    let greenView = UIView()
    let blueView = UIView()
    let stackView = UIStackView()
    //axis : 가로 세로
    //alignment: Y축 정렬
    //distribution: X축 정렬
    //spacing: 간격

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view를 추가한 뒤 오토레이아웃 적용
        redView.backgroundColor = .red
//        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
//        view.addSubview(redView)
//        redView.addSubview(greenView)
//        view.addSubview(blueView)
        stackView.backgroundColor = .yellow
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 50
        
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        greenView.translatesAutoresizingMaskIntoConstraints = false
//        blueView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
//        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
//
//        let constraints = [
//            greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
//            greenView.centerYAnchor.constraint(equalTo: redView.centerYAnchor),
//            greenView.widthAnchor.constraint(equalToConstant: 200),
//            greenView.heightAnchor.constraint(equalToConstant: 200)
//        ]
//        NSLayoutConstraint.activate(constraints)
//
//        NSLayoutConstraint.activate([
//            blueView.widthAnchor.constraint(equalToConstant: 120),
//            blueView.heightAnchor.constraint(equalToConstant: 120),
//            blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 40),
//            blueView.centerXAnchor.constraint(equalTo: redView.centerXAnchor)
//            ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            redView.widthAnchor.constraint(equalToConstant: 100),
            redView.heightAnchor.constraint(equalToConstant: 100),
            blueView.widthAnchor.constraint(equalToConstant: 100),
            blueView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }


}

