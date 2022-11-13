//
//  WeatherInfo.swift
//  WeatherPublisher
//
//  Created by 이태형 on 2022/10/19.
//

import Foundation

struct WeatherInfo: Codable{
    let main: Main
    struct Main: Codable{
        let temp: Double
    }
}
