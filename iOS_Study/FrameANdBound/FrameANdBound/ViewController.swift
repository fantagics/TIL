//
//  ViewController.swift
//  FrameANdBound
//
//  Created by 이태형 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Frame
        //parent View를 기준으로 이동
//        secondView.frame.origin = CGPoint(x: 50, y: 50)
//        thirdView.frame.origin = CGPoint(x: 50, y: 50)
    
        //Bounds
        //자기자신을 기준
        //좌표(0,0)을 (50,50)으로 설정
        //현재 secondView의 좌표는 (0,0)
        secondView.bounds.origin = CGPoint(x: 50, y: 50)
    }


}

