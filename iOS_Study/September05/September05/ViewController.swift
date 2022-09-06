//
//  ViewController.swift
//  September05
//
//  Created by 이태형 on 2022/09/05.
//

import UIKit

class ViewController: UIViewController {
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        globalAsync()
//        globalSync()
//        serialAsync()
//        serialSync()
//        dispatchGroup()
//        dispatchSemaphore()
    }

}

extension ViewController{
    
// sync / async
    //Sync : 기다림
    //Async : 기다리지 않음
    
//DispathQueue.main
    //Serial - 하나의 스레드
    //느리지만 일을 원하는 순서대로 실행
    
//OperationQueue : DispathQueue를 중간에 중단할 수 있다는 특징이 있다
    
//Global
    //Concurrent - 여러개의 스레드
    func globalAsync(){
        value = 10
        DispatchQueue.global().async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        DispatchQueue.global().async {
            sleep(2)
            self.value = 60
            print(self.value, 5)
        }
        print(value)  //Main
    }
    
    func globalSync(){
        value = 10
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        DispatchQueue.global().sync {
            sleep(2)
            self.value = 60
            print(self.value, 5)
        }
        print(value)
    }
    //UI작업을 해야하는 main스레드가 기다리기때문에 UI도 느리게 동작함
    
    
    func serialAsync(){
        let queue = DispatchQueue(label: "private", qos: .default) //Custom
        //기본값은 Serial (attribute옵션에서 concurrent로 변경가능)
        //qos(Quality Of Seervice) : 작업 속도 (우선순위)
        value = 10
        //순서대로 실행
        queue.async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        queue.async {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        queue.async {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        queue.async {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        queue.async {
            sleep(2)
            self.value = 60
            print(self.value, 5)
        }
        print(value)//기다리지 않고 먼저 실행
    }
    
    func serialSync(){
        let queue = DispatchQueue(label: "private", qos: .default) //Custom
        value = 10
        
        queue.sync {
            sleep(2)
            self.value = 20
            print(self.value, 1)
        }
        queue.sync {
            sleep(2)
            self.value = 30
            print(self.value, 2)
        }
        queue.sync {
            sleep(2)
            self.value = 40
            print(self.value, 3)
        }
        queue.sync {
            sleep(2)
            self.value = 50
            print(self.value, 4)
        }
        queue.sync {
            sleep(2)
            self.value = 60
            print(self.value, 5)
        }
        print(value)
    }
    
    //Dispatch 작업의 그룹화
    //여러개의 작업을 동시에 끝난 시점이 필요할 때
    func dispatchGroup(){
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            sleep(2)
            self.value = 20
            print(self.value, 1)
            group.leave()
        }
        group.enter()
        DispatchQueue.global().async {
            sleep(4)
            self.value = 30
            print(self.value, 2)
            group.leave()
        }
        group.enter()
        DispatchQueue.global().async {
            sleep(1)
            self.value = 40
            print(self.value, 3)
            group.leave()
        }
        group.notify(queue: .main, execute: {
            print("Done")
        })
        
    }
    
    //작업의 수 제한
    func dispatchSemaphore(){
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 2)
        group.enter()
        semaphore.wait()  //-1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 20
            print(self.value, 1)
            group.leave()
            semaphore.signal()  //+1
        }
        group.enter()
        semaphore.wait()  //-1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 30
            print(self.value, 2)
            group.leave()
            semaphore.signal()  //+1
        }
        group.enter()
        semaphore.wait()  //현재 0이므로 +될 떄까지 대기 , -1
        DispatchQueue.global().async {
            sleep(3)
            self.value = 40
            print(self.value, 3)
            group.leave()
            semaphore.signal()  //+1
        }
        group.notify(queue: .main, execute: {
            print("Done")
        })
    }
}

//extension ViewController{
//    let timer = Timer()  //2개 이상 사용하면 꼬임
//    private var timer: DispatchSourceTimer!  //..?
//}
