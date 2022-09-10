//
//  ViewController.swift
//  ResultType-Example
//
//  Created by 이태형 on 2022/09/07.
// Result & CustomView(Button)

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        기존
//        getQuote{ quote, errorCode in
//            if let quote = quote{
//                print(quote.content)
//            }else{
//                switch errorCode{
//                case 0:
//                    print("error")
//                case 1:
//                    print("response error")
//                case 2:
//                    print("data error")
//                default:
//                    print(" ")
//                }
//            }
//        }
        
//        Result
//        getQuote{ result in
//            switch result{
//            case .success(let quote):  //Quote
//                print(quote)
//            case .failure(let error):  //NetworkError
//                print(error.localizedDescription)
//            }
//        }
        
        throwingGetQuote{ result in
            switch result{
            case .success(let data):
                do{
                    let quote = try self.decodeData(data: data)  //throws 메서드이기때문에 try필요
                    print(quote)
                } catch{
                    print(error)  //decode error
                }
            case .failure(let error):
                print(error)  //network error
            }
        }
    }


}

extension ViewController{
//    기존
//    private func getQuote(completion: @escaping (Quote?, Int?)-> Void){
//        let url = URL(string: "https://api.quotable.io/random")
//        URLSession.shared.dataTask(with: url!){ data, response, error in
//            guard error == nil else{
//                completion(nil,0)
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//                  (200..<300).contains(response.statusCode) else {
//                      completion(nil,1)
//                      return
//                  }
//            guard let data = data else {
//                completion(nil,2)
//                return
//            }
//            do{
//                let quote = try JSONDecoder().decode(Quote.self, from: data)
//                completion(quote, nil)
//
//            } catch{
//                print(error)
//            }
//        }.resume()
//    }
    
//    Result<success, failure>
//    private func getQuote(completion: @escaping (Result<Quote, NetworkError>)-> Void){
//        let url = URL(string: "https://api.quotable.io/random")
//        URLSession.shared.dataTask(with: url!){ data, response, error in
//            //completion(.failure(.communicationError))  //error 발생시
//            guard error == nil else{
//                completion(.failure(.communicationError))
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//                  (200..<300).contains(response.statusCode) else {
//                      completion(.failure(.badResponse))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            do{
//                let quote = try JSONDecoder().decode(Quote.self, from: data)
//                completion(.success(quote))
//            } catch{
//                print(error)
//            }
//        }.resume()
//    }
    
//    try-throws
    private func throwingGetQuote(completion: @escaping (Result<Data, NetworkError>)-> Void) { // ) throws {
        let url = URL(string: "https://api.quotable.io/random")
//        guard let url = url else {
//            throw NetworkError.badURL
//        }
        URLSession.shared.dataTask(with: url!){ data, response, error in
            guard error == nil else{
                completion(.failure(.communicationError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                      completion(.failure(.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            //do{  }catch{  } 대신
            completion(.success(data))
        }.resume()
    }
    
//    private func decodeData(data: Data) -> Quote?{
//        do{
//            return try JSONDecoder().decode(Quote.self, from: data)
//        }catch{
//            return nil
//        }
//    }
    private func decodeData(data: Data) throws -> Quote?{
        return try? JSONDecoder().decode(Quote.self, from: data)
    }
    
}

