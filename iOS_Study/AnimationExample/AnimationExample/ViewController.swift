//
//  ViewController.swift
//  AnimationExample
//
//  Created by 이태형 on 2022/08/26.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    let redView = UIView()
    let button = UIButton(type: .system)
    
//    var redViewUpperAnchor: NSLayoutConstraint?
//    var redViewLowerAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
}

extension ViewController{
    private func setUI(){
        redView.backgroundColor = .red
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(button)
        view.addSubview(redView)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        redView.translatesAutoresizingMaskIntoConstraints = false
        
        //Priority: 0-1000
//        redViewUpperAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
//        redViewUpperAnchor?.priority = UILayoutPriority(751)
//        redViewLowerAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600)
//        redViewLowerAnchor?.priority = .defaultHigh
//        redViewUpperAnchor?.isActive = true
//        redViewLowerAnchor?.isActive = true
//
//        NSLayoutConstraint.activate([
//            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            redView.widthAnchor.constraint(equalToConstant: 60),
//            redView.heightAnchor.constraint(equalToConstant: 60),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
//        ])
        
        redView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(80).priority(250)
            $0.centerX.equalToSuperview()
            //$0.width.height.equalTo(60)
            $0.size.equalTo(60)
        }
        button.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            //$0.bottom.equalToSuperview().inset(80)
            $0.bottom.equalToSuperview().offset(-80)
        }
        
    }
    @objc func didTapButton(_ sender: UIButton){
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            //self.redViewUpperAnchor?.constant = 600
//            self.redViewLowerAnchor?.priority = .required
            self.redView.snp.updateConstraints{
                $0.top.equalToSuperview().inset(600)
            }
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
}
