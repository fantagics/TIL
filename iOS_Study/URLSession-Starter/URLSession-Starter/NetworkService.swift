//
//  NetworkService.swift
//  URLSession-Starter
//
//  Created by 이태형 on 2022/08/31.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init(){}
    
    func fetch(urlString: String, completion: @escaping (WeatherInfo)->Void){
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            guard error == nil else{fatalError()}
            guard let response = response as? HTTPURLResponse else{fatalError()}
            guard (200..<400).contains(response.statusCode) else{fatalError()}
            guard let data = data else{return}
            do{
                let decodeData = try JSONDecoder().decode(WeatherInfo.self, from: data)
                print(decodeData.main.temp)
//                print(Thread.isMainThread)
                DispatchQueue.main.async {
                    completion(decodeData)
                }
            }
            catch{
                fatalError()
            }
        }.resume()
    }
}
