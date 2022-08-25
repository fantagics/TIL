//
//  DataManager.swift
//  DelegateExample
//
//  Created by 이태형 on 2022/08/26.
//

import Foundation

class DataManager{
    static let shared = DataManager()
    private init(){}
    
    var text = ""
}
