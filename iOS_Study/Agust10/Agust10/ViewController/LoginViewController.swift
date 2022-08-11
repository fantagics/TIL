//
//  ViewController.swift
//  Agust10
//
//  Created by 이태형 on 2022/08/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    let idInputView = InputView(type: .id)
    let pwInputView = InputView(type: .password)
    let loginBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginLabel.text = "로그인"
        loginLabel.font = .systemFont(ofSize: 25, weight: .bold)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.backgroundColor = .systemBlue
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.layer.cornerRadius = 4
        
        view.addSubview(loginLabel)
        view.addSubview(idInputView)
        view.addSubview(pwInputView)
        view.addSubview(loginBtn)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        idInputView.translatesAutoresizingMaskIntoConstraints = false
        pwInputView.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            idInputView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            idInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pwInputView.topAnchor.constraint(equalTo: idInputView.bottomAnchor, constant: 12),
            pwInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pwInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginBtn.topAnchor.constraint(equalTo: pwInputView.bottomAnchor, constant: 20),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 90)
        ]
        NSLayoutConstraint.activate(constraints)
        
        loginBtn.addTarget(self, action: #selector(didTapLoginbtn), for: .touchUpInside)
    }
    
    @objc func didTapLoginbtn(_ sender: UIButton){
        guard let id = idInputView.text, let pw = pwInputView.text else{return}
        id == LoginManager().id && pw == LoginManager().password ? login() : presentAlert()
    }
    func login(){
            present(HomeViewController(), animated: true)
    }
    func presentAlert(){
        let alertController = UIAlertController(title: "로그인 실패", message: "아이디 및 비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okBtn)
        present(alertController, animated: true)
    }
}
