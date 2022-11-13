//
//  ViewController.swift
//  preprocessing-Exam
//
//  Created by 이태형 on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var serverNum = 1
        
        #if TEST
        print("TEST SERVER")
        #elseif DEBUG
        print("server 3") //Debug
        serverNum = 3
        #elseif QA  //QA
        serverNum = 5
        #else
        print("server 10")  //Release
        serverNum = 10
        #endif
        print(serverNum)
        
        //if available
        if #available(iOS 13, *){ }
    }


}

