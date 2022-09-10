//
//  NetworkError.swift
//  ResultType-Example
//
//  Created by 이태형 on 2022/09/07.
//

import Foundation

enum NetworkError: Error{  //Error 프로토콜 채택하여 커스텀 에러 생성
    case badURL
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}

extension NetworkError: LocalizedError{  //NetworkError.localizedDescription
    var errorDescription: String?{
        switch self {
        case .badURL:
            return "1"
        case .badResponse:
            return "응답이 잘못되었습니다."
        case .communicationError:
            return "3"
        case .decodeFailed:
            return "4"
        case .noData:
            return "5"
        }
    }
}
