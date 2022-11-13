//
//  WeatherService.swift
//  WeatherPublisher
//
//  Created by 이태형 on 2022/10/19.
//

import Foundation
import UIKit
import Combine

struct WeatherService{
    let key = "yourAPiKey"
    
    func getWeather(city: String)-> AnyPublisher<WeatherInfo, Error>{
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ publisher in
//                publisher.response
                return publisher.data
            }
            .decode(type: WeatherInfo.self, decoder: JSONDecoder())
//            .map{ weatherInfo in
//                return weatherInfo.main
//            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
