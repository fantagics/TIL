//
//  ViewController.swift
//  MyFirstProject
//
//  Created by 이태형 on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)
    
//MARK: - @IBOutlet
    
    
//MARK: - LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(label)
        label.text = "이태형"
        label.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 50, width: 200, height: 100)
        label.backgroundColor = .red
        label.textAlignment = .center
        
        view.addSubview(button)
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.green, for: .normal)
//        button.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY + 50, width: 200, height: 100)
        button.frame.origin = CGPoint(x: view.frame.midX - 100, y: view.frame.midY + 50)
//        button.frame.size = CGSize(width: 200, height: 100)
        button.sizeToFit()
        
        button.addTarget(self, action: #selector(DidTapButton(_:)), for: .touchUpInside)
    }
    
    
//MARK: - function
    @objc func DidTapButton(_ sender: UIButton){
        print("Tapped : \(sender.currentTitle!)")
    }
    
//MARK: - @IBAction
    
    
}

