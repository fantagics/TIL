//
//  MainCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이태형 on 2022/10/12.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate{
    func didLogout(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .yellow
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
    
    
}

extension MainCoordinator: MainViewControllerDelegate{
    func logout() {
        delegate?.didLogout(self)
    }
    
    
}
