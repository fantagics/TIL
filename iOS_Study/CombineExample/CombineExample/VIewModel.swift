//
//  VIewModel.swift
//  CombineExample
//
//  Created by 이태형 on 2022/10/17.
//

import Foundation
import UIKit
import Combine

class ViewModel{
    var content = PassthroughSubject<String, Never>()
    
    func request(){
        Task{
            let quote = try await APIService().getQuote()
            content.send(quote.content)
        }
    }
}
