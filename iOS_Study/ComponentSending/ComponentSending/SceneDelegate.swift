//
//  SceneDelegate.swift
//  ComponentSending
//
//  Created by 이태형 on 2022/08/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
                
//        window?.rootViewController = ViewController()  //시작 VC
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }

}

