//
//  ViewController.swift
//  WeatherPublisher
//
//  Created by 이태형 on 2022/10/19.
//

import UIKit
import Combine

class ViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        WeatherService.getWeather(city: "seoul")
//            .sink(receiveCompletion: {compeletion in
//                switch compeletion{
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(error)
//                    break
//                }
//            }, receiveValue: {weatherInfo in
//                print(weatherInfo.main)
//            })
//            .store(in: &cancellables)
        
        
    }

    func textFieldNotification(){
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: cityTextField)
            .compactMap{ ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)}
            .map { text in
                return text
            }
            .sink { text in
                print(text)
            }
            .store(in: &cancellables)
//            .compactMap{ notification in
//                (notification.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//                //percent Encoding
//            }
//            .flatMap{city in
//                print(city)
//                WeatherService.getWeather(city: city)
//                    .assertNoFailure()
//                    .map{ $0}
//
//            }
//            .store(in: &cancellables)
    }
    
}

