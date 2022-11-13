//
//  ViewController.swift
//  DebugingTool2
//
//  Created by 이태형 on 2022/10/26.
//
import SwiftUI
import UIKit

class ViewController: UIViewController {
    var value = 0
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    @objc func didTapButton(_ sendder: UIButton){
        print(".")
        value += 10
    }
}

extension ViewController{
    private func setUI(){
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

#if DEBUG
struct ViewControllerRepresentation: UIViewControllerRepresentable{
    func makeUIViewController(context: Context)-> ViewController{
        return ViewController()
    }
    func updateUIViewController(_ uiViewController: ViewController, context: Context){ }
}
struct ViewController_Preview: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentation()
    }
}
#endif
