//
//  LoginCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이태형 on 2022/10/12.
//

import Foundation
import UIKit

protocol LoginCoordinatirDelegate{
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator{
    var delegate: LoginCoordinatirDelegate?
    
    var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let  viewController = LoginViewController()
        viewController.view.backgroundColor = .red
        viewController.delegate = self
//        navigationController.pushViewController(viewController, animated: true)
        navigationController.viewControllers = [viewController]
    }
    
    
}

extension LoginCoordinator: LoginVIewControllerDelegate{
    func login() {
        delegate?.didLoggedIn(self)
    }
    
    
}
