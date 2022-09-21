//
//  FileManagerViewController.swift
//  FileManager-Example
//
//  Created by 이태형 on 2022/09/21.
//

import UIKit

class FileManagerViewController: UIViewController {
    
    let fileManager = FileManager.default

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

//extension FileManagerViewController{
//    func save(){
//        var isDirectory: ObjCBool = true
//        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory){
//            print(getdocumentDirectoryPath().path)
//            print("폴더 있음")
//            let someString = "Hello World"
//            do{
//                try someString.write(to: getMyAppFilePath(), atomically: true, encoding: .utf8)
//                print("파일 쓰기 성공")
//            }catch{
//                print("파일 쓰기 실패: \(error)")
//            }
//        }else{
//            print("폴더 없음")
//            do{
//                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
//                print("폴더 생성 완료")
//            }catch{
//                print("폴더 생성 실패: \(error)")
//            }
//        }
//    }
//    func load(){
//        do{
//            let someString = try String(contentsOf: getMyAppFilePath())
//            print("파일 로드 완료")
//            print(someString)
//        }catch{
//            print("파일 로드 에러")
//        }
//    }
//}
extension FileManagerViewController{
    func save(){
        var isDirectory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory){
            let person = Person(name: "ABC", age: "111")
            do{
                let data = try NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false)
                do{
                    try data.write(to: getMyAppFilePath())
                    print("파일 쓰기 성공")
                }catch{
                    print("파일 쓰기 에러")
                }
            }catch{
                print("아카이브 에러: \(error)")
            }
        }else{
            print("폴더 없음")
            do{
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            }catch{
                print("폴더 생성 실패: \(error)")
            }
        }
    }
    func load(){
        do{
            let data = try Data(contentsOf: getMyAppFilePath())
            do{
                let person = try NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
                print("언아카이브 성공: \(person?.name), \(person?.age)")
            }catch{
                print("언아카이브 에러: \(error)")
            }
        }catch{
            print("파일 로드 에러")
        }
    }
}

extension FileManagerViewController{
    func getdocumentDirectoryPath()-> URL{
        let documentDirectoryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectoryPath
    }
    func getMyAppDirectoryPath()-> URL{
        let documentDirectoryPath = getdocumentDirectoryPath()
        let myAppDirectoryPath = documentDirectoryPath.appendingPathComponent("My App", isDirectory: true)
        return myAppDirectoryPath
    }
    func getMyAppFilePath()-> URL{
        let myAppDirectoryPath = getMyAppDirectoryPath()
        let filePath = myAppDirectoryPath.appendingPathComponent("Test.txt")
        return filePath
    }
}

//Codable 역할
class Person: NSObject, NSCoding, NSSecureCoding{
    //NSSecureCoding: 보안, 안정성 보장
    static var supportsSecureCoding: Bool = true
    
    let name: String
    let age: String
    
    init(name: String, age:String){
        self.name = name
        self.age = age
    }
    
    //NSCoding
        //Encoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")  //Int 뷸가 / Int64 가능?
    }
        //Decoding
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let age = coder.decodeObject(forKey: "age") as! String
        
        self.init(name: name, age: age)
    }
}
