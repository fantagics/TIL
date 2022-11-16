//
//  ViewController.swift
//  TDD_221114
//
//  Created by 이태형 on 2022/11/16.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        guard let id = idTextField.text,
              let pw = pwTextField.text else{
            showAlert(.notEnoughInfo)
            return
        }
        guard !id.isEmpty else{
            showAlert(.idRequired)
            return
        }
        guard id == "Admin", pw == "Admin" else{
            showAlert(.wrongPassword)
            return
        }
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        present(nextVC!, animated: true)
    }
    
    func showAlert(_ error: LoginError){
        let alertController = UIAlertController(title: "경고", message: error.localizedDescription, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

