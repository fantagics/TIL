//
//  NetworkService.swift
//  AsyncAwaitExample
//
//  Created by 이태형 on 2022/09/19.
//

import Foundation
class NetworkService {
    let url = URL(string: "https://api.quotable.io/random")!
    
    static let shared = NetworkService()
    
    private init(){ }
    
    func getQuote(compeletion: @escaping (Result<String, NetworkError>)-> Void)-> String{
        var result = "TEST"
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error)
                compeletion(.failure(.communicationError))
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode){
                compeletion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                compeletion(.failure(.noData))
                return}
            do{
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                result = quote.content
                compeletion(.success(result))
            }catch{
                print(error)
                compeletion(.failure(.decodeFailed))
            }
        }.resume()
        return result
    }
    
    func getQuote() async -> String { //async안에서 await(Task) 불필요
        do{  //URLSession.shared.data(from url: URL)가 async throws 이므로 do-catcch문 및 try 필요
            let (data, response) = try await URLSession.shared.data(from: url)
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode){
                return "응답 에러"
            }
            let quote = try JSONDecoder().decode(Quote.self, from: data)
            return quote.content
        }catch{
            return "Decode Error"
        }
    }
    
//    func getQuotes() async -> [String]{
//        var quotes = [String]()
//        for _ in 1 ... 3{
//            quotes.append(await getQuote())
//        }
//        return quotes
//    }
    
//    func getQuotes() async -> [String]{
//        async let firstQuote = getQuote()
//        async let secondQuote = getQuote()
//        async let thirdQuote = getQuote()
//        return await [firstQuote, secondQuote, thirdQuote]  //순서대로 끝나지 않음
//    }
    
    func getQuotes() async -> [String]{
        let firstQuote = await getQuote()  //1
        let secondQuote = await getQuote()  //2
        let thirdQuote = await getQuote()  //3
        return [firstQuote, secondQuote, thirdQuote]  //1,2,3 순서대로 기다림
        
    }
    
    //checkContinuation : escaping->async
    func continueationGetQuote() async -> String {
        return await withCheckedContinuation{continueation in
            getQuote{ result in
                switch result {
                case .success(let quote):
                    continueation.resume(returning: quote)  //resume은 한번만 사용
                case .failure(let error):
//                    continueation.resume(throwing: error)  //throws한다면
                    print(error)
                }
            }
        }
    }
}
