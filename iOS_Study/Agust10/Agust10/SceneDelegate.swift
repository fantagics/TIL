//
//  SceneDelegate.swift
//  Agust10
//
//  Created by 이태형 on 2022/08/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = LoginViewController()  //start VC
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
}
