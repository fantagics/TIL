//
//  LoginError.swift
//  TDD_221114
//
//  Created by 이태형 on 2022/11/16.
//

import Foundation
import UIKit

enum LoginError: Error{
    case notEnoughInfo
    case idRequired
    case wrongPassword
}
extension LoginError: LocalizedError{
    var errorDescription: String?{
        switch self{
        case .notEnoughInfo:
            return "아이디, 패스워드를 입력하세요"
        case .idRequired:
            return "아이디를 입력하세요."
        case .wrongPassword:
            return "비밀번호가 잘못되었습니다."
        }
    }
}
