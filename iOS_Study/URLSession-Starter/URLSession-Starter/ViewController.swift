//
//  ViewController.swift
//  URLSession-Starter
//
//  Created by 이태형 on 2022/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    let temperatorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        
        NetworkService.shared.fetch(urlString: URL.weather, completion: { weatherInfo in
//            let celsius = (weatherInfo.main.temp - 32) * 5 / 9
//            self.temperatorLabel.text = String(format: "%.2f\'C", celsius)
            self.temperatorLabel.text = weatherInfo.weather.first?.main
        })
    }


}

extension ViewController{
    
    private func setUI(){
        temperatorLabel.text = "0"
        view.addSubview(temperatorLabel)
        temperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
