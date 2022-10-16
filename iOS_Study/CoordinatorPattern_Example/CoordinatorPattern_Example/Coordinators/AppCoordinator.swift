//
//  AppCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 이태형 on 2022/10/12.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator]{ get set }
    func start()
}

class AppCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    var isLoggedIn = false
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        isLoggedIn ? showMainVIewController() : showLoginVIewController()
    }
    
    private func showLoginVIewController(){
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
        coordinator.delegate = self
        childCoordinators.append(coordinator)
    }
    private func showMainVIewController(){
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.start()
        coordinator.delegate = self
        childCoordinators.append(coordinator)
    }
}

extension AppCoordinator: LoginCoordinatirDelegate{
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator}
        showMainVIewController()
    }
}

extension AppCoordinator: MainCoordinatorDelegate{
    func didLogout(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== coordinator}
        showLoginVIewController()
    }
}
