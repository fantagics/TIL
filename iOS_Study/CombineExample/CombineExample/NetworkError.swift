//
//  NetworkError.swift
//  CombineExample
//
//  Created by 이태형 on 2022/10/17.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case badRequest
    case communicationError
    case decodedError
    case noData
}
