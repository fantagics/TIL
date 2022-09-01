//
//  Model.swift
//  URLSession-Starter
//
//  Created by 이태형 on 2022/08/31.
//

import Foundation

struct WeatherInfo: Codable{
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable{
        let temp: Double
        let feels_like: Double
    }
    
    struct Weather: Codable{
        let main: String
    }
}
