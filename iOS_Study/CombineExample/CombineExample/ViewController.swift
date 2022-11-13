//
//  ViewController.swift
//  CombineExample
//
//  Created by 이태형 on 2022/10/17.
//

import UIKit
import Combine

class ViewController: UIViewController {
//    var content = PassthroughSubject<String, Never>()  //Never: 에러 발생 X
    var cancellable = Set<AnyCancellable>()
    
    private let viewModel = ViewModel()

    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        content.sink(receiveCompletion: <#T##((Subscribers.Completion<Never>) -> Void)##((Subscribers.Completion<Never>) -> Void)##(Subscribers.Completion<Never>) -> Void#>, receiveValue:  ) //Error발생 시
        viewModel.content
//            .sink{ content in  //구독 받았을 떄
//                self.quoteLabel.text = content
//            }
            .receive(on: DispatchQueue.main)
            .map{ Optional($0)}
            .assign(to: \.quoteLabel.text, on: self)
            .store(in: &cancellable)
    }

    @IBAction func didTapButton(_ sender: UIButton) {
//        APIService().getQuote(completion: {result in
//            switch result{
//            case .success(let quote):
////                self.quoteLabel.text = quote.content
//                self.content.send(quote.content)  //publisher
//            case .failure(let error):
//                self.quoteLabel.text = "에러발생"
//                print(error)
//            }
//        })
        
//        Task{
//            let quote = try await APIService().getQuote()
//            content.send(quote.content)
//        }
        viewModel.request()
    }
    
}

