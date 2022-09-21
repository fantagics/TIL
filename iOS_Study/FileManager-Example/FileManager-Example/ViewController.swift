//
//  ViewController.swift
//  FileManager-Example
//
//  Created by 이태형 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSaveBtn(_ sender: UIButton) {
        save()
    }
    @IBAction func didTapLoadBtn(_ sender: UIButton) {
        load()
    }
}

extension ViewController{
    func save(){
        let restaurant = Restaurant(name: "활어세꼬시", owner: "가나다")
        do{
            let encodeData = try JSONEncoder().encode(restaurant)
            userDefaults.set(encodeData, forKey: "restaurant")
            print("SAVE")
        }
        catch{
            print("SAVE FAIL: \(error)")
        }
    }
    func load(){
        print("LOAD")
        guard let object = userDefaults.data(forKey: "restaurant") else{return}
        do{
            let decodedObject = try JSONDecoder().decode(Restaurant.self, from: object)
            print(decodedObject)
        }catch{
            print("Decode Fail: \(error)")
        }
    }
    
}

struct Restaurant: Codable{
    let name: String
    let owner: String
    
//    init(name: String, owner: String){
//        self.name = name
//        self.owner = owner
//    }
    
}
