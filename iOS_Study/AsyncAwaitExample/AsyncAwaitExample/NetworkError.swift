//
//  NetworkError.swift
//  AsyncAwaitExample
//
//  Created by 이태형 on 2022/09/19.
//

import Foundation

enum NetworkError: Error{
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}
