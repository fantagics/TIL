//
//  LoginValidator.swift
//  TDD_221114UITests
//
//  Created by 이태형 on 2022/11/16.
//

import Foundation

class LoginValidator{
    func isValidId(id: String)-> Bool{
        return id.count > 3
    }
    
    func isValidPw(pw: String)-> Bool{
        return pw.count >= 5
    }

    func shouldLogin(user: User, completion: @escaping (Bool)-> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            completion(self.isValidId(id: user.id) && self.isValidPw(pw: user.pw))
        })
    }
}
