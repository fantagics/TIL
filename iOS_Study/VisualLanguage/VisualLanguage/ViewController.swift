//
//  ViewController.swift
//  VisualLanguage
//
//  Created by 이태형 on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    private let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .systemRed
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String: Any] = ["R": redView]
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[R(30)]-|", metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[R]-30-|", metrics: nil, views: views)
        view.addConstraints(constraints)
    }


}

