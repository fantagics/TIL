//
//  ViewController.swift
//  AsyncAwaitExample
//
//  Created by 이태형 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    let lable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let result = NetworkService.shared.getQuote(){ result in
//            switch result{
//            case .success(let quote):
//                print("Escaping: \(quote)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//        print("NonEscaping: \(result)")
        Task{
//            let quote = await NetworkService.shared.getQuote()  //await는 마지막 한번 사용할때 Task 사용
//            print(quote)
            
//            print(await NetworkService.shared.getQuotes())
            
            print(await NetworkService.shared.continueationGetQuote())
        }
    }
}

extension ViewController{
    private func setUI(){
        
    }
}
