//
//  GestureViewController.swift
//  RatingAppByCode
//
//  Created by 이태형 on 2022/08/01.
//

import UIKit

class GestureViewController: UIViewController {
    lazy var leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
    lazy var rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        leftGesture.direction = UISwipeGestureRecognizer.Direction.left
        rightGesture.direction = UISwipeGestureRecognizer.Direction.right
        
        view.addGestureRecognizer(leftGesture)
        view.addGestureRecognizer(rightGesture)
        
    }
    
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer){
//        let touchLocation = sender.location(in: view)
//        print(touchLocation)
        if sender == leftGesture{
            print("left")
            let nextVC = LeftGestureViewController()
            present(nextVC, animated: true, completion: nil)
        }
        else{
            print("right")
            let nextVC = RightGestureViewController()
            present(nextVC, animated: true, completion: nil)
        }
    }
}
